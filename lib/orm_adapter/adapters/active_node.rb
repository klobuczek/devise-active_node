require 'active_node'

module OrmAdapter
  class ActiveNode < Base
    # Return list of column/property names
    def column_names
      klass.attribute_names
    end

    # @see OrmAdapter::Base#get!
    def get!(id)
      klass.find(wrap_key(id))
    end

    # @see OrmAdapter::Base#get
    def get(id)
      find_first(id: wrap_key(id))
    end

    # @see OrmAdapter::Base#find_first
    def find_first(options = {})
      find_all(options).first
    end

    # @see OrmAdapter::Base#find_all
    def find_all(options = {})
      klass
      .order(options.delete :order)
      .where(options.delete :conditions)
      .limit(options.delete :limit)
      .offset(options.delete :offset)
      .where(options)
    end

    # @see OrmAdapter::Base#create!
    def create!(attributes = {})
      klass.create!(attributes)
    end

    # @see OrmAdapter::Base#destroy
    def destroy(object)
      object.destroy && true if valid_object?(object)
    end
  end
end

ActiveSupport.on_load(:active_node) do
  extend ::OrmAdapter::ToAdapter
  self::OrmAdapter = ::OrmAdapter::ActiveNode
end