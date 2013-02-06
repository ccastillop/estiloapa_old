Time::DATE_FORMATS[:hora] = "%H:%M"
Time::DATE_FORMATS[:fecha_hora] = "%d%B%y %H:%M"
Date::DATE_FORMATS[:fecha_larga] = "%A %d de %B de %Y"
Date::DATE_FORMATS[:mes_anio] = "%B %Y"
Date::DATE_FORMATS[:dia_mes_anio] = "%d-%m-%Y"
Date::DATE_FORMATS[:anio_mes] = "%Y-%b"
Date::DATE_FORMATS[:short_ordinal] = lambda { |date| date.strftime("%B #{date.day.ordinalize}") }