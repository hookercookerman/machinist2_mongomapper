require "machinist"
require "machinist/machinable"

begin
  require "mongo_mapper"
rescue LoadError
  puts "mongo_mapper is not installed (gem install mongo_mapper)"
  exit
end

require 'machinist/mongo_mapper/blueprint'
require 'machinist/mongo_mapper/lathe'

module Machinist::MongoMapper
  module BlueprintClass
    def blueprint_class
      Machinist::MongoMapper::Blueprint
    end
  end
end

MongoMapper::Document.append_extensions(Machinist::Machinable)
MongoMapper::Document.append_extensions(Machinist::MongoMapper::BlueprintClass)
MongoMapper::EmbeddedDocument.append_extensions(Machinist::Machinable)
MongoMapper::EmbeddedDocument.append_extensions(Machinist::MongoMapper::BlueprintClass)