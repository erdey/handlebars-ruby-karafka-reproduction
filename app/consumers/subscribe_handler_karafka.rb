# frozen_string_literal: true

class SubscribeHandlerKarafka < ApplicationConsumer
  def consume
    log_info

    messages.each do |message|
      template = HandlebarsContext.compile("Your {{localize_category}} is complete")
      result = template.call({})

      puts 'result: ' + result
    end
  end

  def log_info
    helper_functions = HandlebarsContext.instance_variable_get('@context')&.instance_variable_get('@functions')&.keys
    puts "Handlebars logging"
  end

  # Run anything upon partition being revoked
  # def revoked
  # end

  # Define here any teardown things you want when Karafka server stops
  # def shutdown
  # end
end
