# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module RDS
    class ReservedDBInstancesOffering

      extend Aws::Deprecations

      # @overload def initialize(id, options = {})
      #   @param [String] id
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :id
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @id = extract_id(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def id
        @id
      end
      alias :reserved_db_instances_offering_id :id

      # The DB instance class for the reserved DB instance.
      # @return [String]
      def db_instance_class
        data.db_instance_class
      end

      # The duration of the offering in seconds.
      # @return [Integer]
      def duration
        data.duration
      end

      # The fixed price charged for this offering.
      # @return [Float]
      def fixed_price
        data.fixed_price
      end

      # The hourly price charged for this offering.
      # @return [Float]
      def usage_price
        data.usage_price
      end

      # The currency code for the reserved DB instance offering.
      # @return [String]
      def currency_code
        data.currency_code
      end

      # The database engine used by the offering.
      # @return [String]
      def product_description
        data.product_description
      end

      # The offering type.
      # @return [String]
      def offering_type
        data.offering_type
      end

      # Indicates if the offering applies to Multi-AZ deployments.
      # @return [Boolean]
      def multi_az
        data.multi_az
      end

      # The recurring price charged to run this reserved DB instance.
      # @return [Array<Types::RecurringCharge>]
      def recurring_charges
        data.recurring_charges
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {ReservedDBInstancesOffering}.
      # Returns `self` making it possible to chain methods.
      #
      #     reserved_db_instances_offering.reload.data
      #
      # @return [self]
      def load
        resp = @client.describe_reserved_db_instances_offerings(reserved_db_instances_offering_id: @id)
        @data = resp.reserveddbinstancesofferings[0]
        self
      end
      alias :reload :load

      # @return [Types::ReservedDBInstancesOffering]
      #   Returns the data for this {ReservedDBInstancesOffering}. Calls
      #   {Client#describe_reserved_db_instances_offerings} if {#data_loaded?} is `false`.
      def data
        load unless @data
        @data
      end

      # @return [Boolean]
      #   Returns `true` if this resource is loaded.  Accessing attributes or
      #   {#data} on an unloaded resource will trigger a call to {#load}.
      def data_loaded?
        !!@data
      end

      # @!group Actions

      # @param [Hash] options ({})
      # @option options [String] :reserved_db_instance_id
      #   Customer-specified identifier to track this reservation.
      #
      #   Example: myreservationID
      # @option options [Integer] :db_instance_count
      #   The number of instances to reserve.
      #
      #   Default: `1`
      # @option options [Array<Types::Tag>] :tags
      #   A list of tags.
      # @return [ReservedDBInstance]
      def purchase(options = {})
        options = options.merge(reserved_db_instances_offering_id: @id)
        resp = @client.purchase_reserved_db_instances_offering(options)
        ReservedDBInstance.new(
          id: resp.data.reserved_db_instance.reserved_db_instance_id,
          data: resp.data.reserved_db_instance,
          client: @client
        )
      end

      # @deprecated
      # @api private
      def identifiers
        { id: @id }
      end
      deprecated(:identifiers)

      private

      def extract_id(args, options)
        value = args[0] || options.delete(:id)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :id"
        else
          msg = "expected :id to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<ReservedDBInstancesOffering>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end