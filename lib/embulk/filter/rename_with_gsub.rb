module Embulk
  module Filter
    class RenameWithGsub < FilterPlugin
      Plugin.register_filter("rename_with_gsub", self)

      def self.transaction(config, in_schema, &control)
        # configuration code:
        rename_regexp = config.param("rename_regexp", :string)
        rename_pattern = Regexp.compile(rename_regexp)
        
        replacement = config.param("replacement", :string)
        
        task = {}

        column_names = self.get_column_names(in_schema)
        
        column_names.each do |org_column_name|
          match = rename_pattern.match(org_column_name)
          
          # require 'pry'; binding.pry
          if match
            new_column_name = org_column_name.gsub(rename_pattern, replacement)
            
            in_schema.each do |column| 
              if column["name"] == org_column_name
                column["name"] = new_column_name
              end
            end
          end
        end
        
        out_columns = in_schema

        yield(task, out_columns)
      end

      def self.get_column_names(in_schema)
        column_names = Array.new
        in_schema.each do |column|
          column_name = column["name"]
          column_names.push column_name
        end

        column_names
      end

      def init
        
      end

      def close
      end

      def add(page)
        # filtering code:
        page.each do |record|
          page_builder.add(record)
        end
      end

      def finish
        page_builder.finish
      end
    end

  end
end

module Embulk
  module Filter
    class RenameWithGsub
      class Searcher
        def self.search_index(in_schema, key_name)
          in_schema.each do |column|
            if column["name"] == key_name
              index = column["index"].to_i
              return index
            else
              return nil
            end
          end
        end
      end
    end
  end
end
