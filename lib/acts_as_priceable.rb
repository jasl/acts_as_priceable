require 'active_support/concern'

module ActsAsPriceable
  extend ActiveSupport::Concern

  module ClassMethods
    # This method will generate price virtual attributes you given.
    # Default you need a column to stored cents named your give name with suffix '_in_cents', but you can change this.
    # In addition, virtual price attribute would be an instance of BigDecimal, you can change it also.
    #
    # Examples:
    #   acts_as_priceable :price
    #   acts_as_priceable :price, :fee
    #   acts_as_priceable :price, suffix: 'cents'
    #   acts_as_priceable :price, class: Money
    #
    # There is also a list of options:
    #
    # * <tt>:suffix</tt> - Specifies the suffix of origin attribute.
    # * <tt>:class</tt> - Specifies price virtual attributes' type.
    def acts_as_priceable(*args)
      options = args.extract_options!

      suffix = options.delete(:suffix) || 'in_cents'
      unless klass = options.delete(:class)
        require 'bigdecimal'
        klass = BigDecimal
      end

      args.each do |field|
        define_method field do
          if price_in_cents = send(:"#{field}_#{suffix}")
            klass.new(price_in_cents) / 100
          end
        end

        define_method :"#{field}=" do |price|
          send(:"#{field}_#{suffix}=", (price * 100).to_i)
        end
      end
    end
  end
end

ActiveRecord::Base.send(:extend, Priceable) if defined?(ActiveRecord)
