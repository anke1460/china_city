(($) ->
  $.fn.china_city = () ->
    @each ->
      selects = $(@).find('.city-select')
      selects.change ->
        $this = $(@)
        next_selects = selects.slice(selects.index(@) + 1) # empty all children city
        $("option", next_selects).remove()
        if next_selects.first()[0] and $this.val() # init next child
          $.get "/china_city/#{$(@).val()}", (data) ->
            if data.length == 0
              next_selects.hide()
              next_selects.val("")
            else
              next_selects.show()
              next_selects.first()[0].options.add(new Option(option[0], option[1])) for option in data

  $ ->
    $('.city-group').china_city()
)(jQuery)
