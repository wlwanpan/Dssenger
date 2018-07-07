require_relative '../helpers/math'

module Collection
  class Base
    include Math

    def initialize bluzelle:
      @_bluzelle = bluzelle
    end

    def load_collection record_ids
      record_ids ||= []

      record_ids =
        if record_ids.empty?
          resp = @_bluzelle.read collection_id
          parse_response(resp) || []
        else
          record_ids

      record_ids.map do |record_id|
        find_record_by_id record_id, VISIBLE_ATTRS
      end
    end

    def record_exist? id
      resp = @_bluzelle.read collection_id
      collection_ids = parse_response resp
      return false if collection_ids.nil?
      collection_ids.include? id
    end

    def create_record attrs
      record_id = generate_record_id attrs
      allowed_attrs = create_record_params attrs
      if @_bluzelle.create record_id.to_s, allowed_attrs.to_json
        allowed_attrs[:_id] = record_id
        save_record record_id
        allowed_attrs
      else
        {error: 'Error saving to bluzelle'}
      end
    end

    def find_record_by_id id, allowed_attrs
      allowed_attrs || = []
      allowed_attrs << :exist

      resp = @_bluzelle.read id.to_s
      output = resp == 'RECORD_NOT_FOUND' ? {exist: false} : parse_response(resp)
      filtered_output = output.select { |key, value| allowed_attrs.include?(key) }
      filtered_output[:_id] = id
      filtered_output
    end

  private

    def collection_id
      (_ID || '').to_s
    end

    def save_record record_id
      resp = @_bluzelle.read collection_id
      record_ids = parse_response resp
      record_ids << record_id
      @_bluzelle.update collection_id, record_ids.to_json
    end

    # Not sure if needs to eval if parsing back to json
    def parse_response resp
      eval(resp)
    rescue => e
      # Autofixing corrupt db value << Not a good idea to change after
      @_bluzelle.update collection_id, [].to_json
    end

    def create_record_params attrs
      return {} if attrs.nil?
      attrs.select { |key, value| ALLOWED_ATTRS.include?(key) }
    end

    def generate_record_id attrs
      return sha256(SecureRandom.uuid) if GEN_ID.empty? || attrs.nil?
      allowed_attrs = attrs.map { |key, value| GEN_ID.include?(key) ? value : nil }
      allowed_attrs_compact = allowed_attrs.compact
      allowed_attrs_as_str = allowed_attrs_compact.join('')
      sha256(allowed_attrs_as_str)
    end

  end
end