module Machinist::MongoMapper
  class Blueprint < Machinist::Blueprint

    # Make and save an object.
    def make!(attributes = {})
      object = make(attributes)
      raise NoMethodError, "Embedded Objects cannot be make! ed" if object.class.embeddable?
      object.save! 
      object.reload
    end

    # Box an object for storage in the warehouse.
    def box(object)
      object.id
    end
   
    # Unbox an object from the warehouse.
    def unbox(id)
      @klass.find(id)
    end
    
    def outside_transaction
      yield
    end

    def lathe_class #:nodoc:
      Machinist::MongoMapper::Lathe
    end

  end
end
