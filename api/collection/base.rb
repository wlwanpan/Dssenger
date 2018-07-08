require_relative '../helpers/math'

module Collection
  class Base
    include Math

    def initialize bluzelle:
      @_bluzelle = bluzelle
    end

    def load_collection record_ids, visible_attrs
      record_ids ||= []
      record_ids = record_ids.empty? ? record_ids : record_ids

      record_ids.map do |record_id|
        find_record_by_id record_id, visible_attrs
      end
    end

    def record_exist? id
      collection_ids = record_ids
      collection_ids.include? id
    end

    def create_record attrs, gen_id
      record_id = generate_record_id attrs
      allowed_attrs = create_record_params attrs
      resp = @_bluzelle.create record_id.to_s, allowed_attrs.to_json

      case resp
        when true
          allowed_attrs[:_id] = record_id
          save_record record_id
          allowed_attrs
        when 'RECORD_EXISTS'
          {error: "#{record_id}: already exist"}
        else
          {error: 'Error saving to bluzelle'}
      end
    end

    def find_record_by_id id, allowed_attrs
      allowed_attrs ||= []
      allowed_attrs << :exist

      resp = @_bluzelle.read id.to_s
      return {exist: false} if resp == 'RECORD_NOT_FOUND'

      parsed_resp = parse_response(resp)
      filtered_output = parsed_resp.select { |key, value| allowed_attrs.include?(key) }
      filtered_output[:exist] = true
      filtered_output[:_id] = id
      filtered_output
    end

    def collection_id id
      (id || '').to_s
    end

    def record_ids
      resp = @_bluzelle.read collection_id
      return [] if resp == 'RECORD_NOT_FOUND'
      parse_response(resp) || []
    end

    def save_record record_id
      current_record_ids = record_ids
      return if current_record_ids.include? record_id
      current_record_ids << record_id
      @_bluzelle.update collection_id, current_record_ids.to_json
    end

    # Not sure if needs to eval if parsing back to json
    def parse_response resp
      eval(resp)
    rescue => e
      # Autofixing corrupt db value << Not a good idea to change after
      @_bluzelle.update collection_id, [].to_json
      nil
    end

    def create_record_params attrs, allowed_attrs
      return {} if attrs.nil?
      attrs.select { |key, value| allowed_attrs.include?(key) }
    end

    def generate_record_id attrs, gen_id
      return sha256(SecureRandom.uuid) if gen_id.empty? || attrs.nil?
      allowed_attrs = attrs.map { |key, value| gen_id.include?(key) ? value : nil }
      allowed_attrs_compact = allowed_attrs.compact
      allowed_attrs_as_str = allowed_attrs_compact.join('')
      sha256(allowed_attrs_as_str)
    end

  end
end