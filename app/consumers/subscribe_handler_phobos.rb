# frozen_string_literal: true

class SubscribeHandlerPhobos
  include Phobos::Handler

  def consume(payload, _metadata)
    template = HandlebarsContext.compile("Your {{localize_category}} is complete")
    result = template.call({})

    puts 'result: ' + result
  end
end
