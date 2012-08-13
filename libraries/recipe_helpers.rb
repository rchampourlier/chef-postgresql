class Chef
  module PostgreSQL
    module RecipeHelpers
      def determine_service_name
        case node['platform']
        when "ubuntu"
          case
          # PostgreSQL 9.1 on Ubuntu 10.04 gets set up as "postgresql", not "postgresql-9.1"
          # Is this because of the PPA?
          when node['platform_version'].to_f <= 10.04 && node['postgresql']['version'].to_f < 9.0
            "postgresql-#{node['postgresql']['version']}"
          else
            "postgresql"
          end
        when "debian"
          case
          when platform_version.to_f <= 5.0
            "postgresql-#{node['postgresql']['version']}"
          when platform_version =~ /squeeze/
            "postgresql"
          else
            "postgresql"
          end
        end
      end
    end
  end
end