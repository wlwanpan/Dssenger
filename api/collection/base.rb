require_relative '../helpers/math'

module Collection
  class Base
    include Math

    def initialize bluzelle:
      @_bluzelle = bluzelle
    end

    def collection_id
      (_ID || '').to_s
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
      @_bluzelle.create record_id.to_s, allowed_attrs.to_json.to_s
    end

    def find_record_by_id id
      resp = @_bluzelle.read id.to_s
      output = resp == 'RECORD_NOT_FOUND' ? {exist: false} : parse_response(resp)
      resp.to_json
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
      attrs.select { |key, value| _ALLOWED_ATTRS.include?(key) }
    end

    def generate_record_id attrs
      return sha256(SecureRandom.uuid) if _GEN_ID.empty? || attrs.nil?
      allowed_attrs = attrs.map { |key, value| _GEN_ID.include?(key) ? value : nil }
      allowed_attrs_compact = allowed_attrs.compact
      allowed_attrs_as_str = allowed_attrs_compact.join('')
      sha256(allowed_attrs_as_str)
    end

  end
end