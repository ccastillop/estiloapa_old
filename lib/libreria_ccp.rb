module LibreriaCcp
  module Arreglos
    #junta sin blancos los arreglos
    def join_wo_blanks(j=" - ")
      b = []
      self.each do |c|
        b << c unless c.blank?
      end
      b.join(j)
    end
  end

  #
  # RFC822 Email Address Regex
  # --------------------------
  # 
  # Originally written by Cal Henderson
  # c.f. http://iamcal.com/publish/articles/php/parsing_email/
  #
  # Translated to Ruby by Tim Fletcher, with changes suggested by Dan Kubb.
  #
  # Licensed under a Creative Commons Attribution-ShareAlike 2.5 License
  # http://creativecommons.org/licenses/by-sa/2.5/
  # 
  module RFC822
    EmailAddress = begin
      qtext = '[^\\x0d\\x22\\x5c\\x80-\\xff]'
      dtext = '[^\\x0d\\x5b-\\x5d\\x80-\\xff]'
      atom = '[^\\x00-\\x20\\x22\\x28\\x29\\x2c\\x2e\\x3a-' +
        '\\x3c\\x3e\\x40\\x5b-\\x5d\\x7f-\\xff]+'
      quoted_pair = '\\x5c[\\x00-\\x7f]'
      domain_literal = "\\x5b(?:#{dtext}|#{quoted_pair})*\\x5d"
      quoted_string = "\\x22(?:#{qtext}|#{quoted_pair})*\\x22"
      domain_ref = atom
      sub_domain = "(?:#{domain_ref}|#{domain_literal})"
      word = "(?:#{atom}|#{quoted_string})"
      domain = "#{sub_domain}(?:\\x2e#{sub_domain})*"
      local_part = "#{word}(?:\\x2e#{word})*"
      addr_spec = "#{local_part}\\x40#{domain}"
      pattern = /\A#{addr_spec}\z/
    end
  end

  module Parametrizar

    TILDES = {
        'ÀÁÂÃÅĀĄĂ' => 'A',
        'Ä' => 'Ae',
        'àáâãåāąă' => 'a',
        'ä' => 'ae',
        'Æ' => 'AE',
        'æ' =>
        'ae',
        'ÇĆČĈĊ' => 'C',
        'çćčĉċ' => 'c',
        'ĎĐ' => 'D',
        'ďđ' => 'd',
        'ÈÉÊËĒĘĚĔĖ' =>'E',
        'èéêëēęěĕė' =>'e',
        'ƒ' => 'f',
        'ĜĞĠĢ' => 'G',
        'ĝğġģ' => 'g',
        'ĤĦ' => 'H',
        'ĥħ' => 'h',
        'ÌÍÎÏĪĨĬĮİ' =>'I',
        'ìíîïīĩĭįı' =>'i',
        'Ĳ' => 'IJ',
        'Ĵ' => 'J',
        'ĵ' => 'j',
        'Ķ' => 'K',
        'ķĸ' => 'k',
        'ŁĽĹĻĿ' => 'L',
        'łľĺļŀ' => 'l',
        'ÑŃŇŅŊ' => 'NI',
        'ñńňņŉŋ' => 'ni',
        'ÒÓÔÕØŌŐŎ' => 'O',
        'Ö' => 'Oe',
        'òóôõøōőŏ' => 'o',
        'ö' => 'oe',
        'Œ' => 'OE',
        'œ' => 'oe',
        'ŔŘŖ' =>'R',
        'ŕřŗ' =>'r',
        'ŚŠŞŜȘ' => 'S',
        'śšşŝș' => 's',
        'ŤŢŦȚ' => 'T',
        'ťţŧț' => 't',
        'ÙÚÛŪŮŰŬŨŲ' =>'U',
        'Ü' => 'Ue',
        'ùúûūůűŭũų' =>'u',
        'ü' => 'ue',
        'Ŵ' => 'W',
        'ŵ' => 'w',
        'ÝŶŸ' =>'Y',
        'ýÿŷ' =>'y',
        'ŹŽŻ' =>'Z',
        'žżź' =>'z'
        }

    def quitar(string)
      TILDES.each do |key, value|
        string = string.gsub %r([#{key}]), value
      end
      string
    end

    def parametriza(nombre_txt,id)
      t = self.quitar(nombre_txt).downcase unless nombre_txt.nil?
      t ||= ""
      t = "#{id}-#{t.gsub(/[^a-z0-9]+/i, '-')}"
      t = t.split "-"
      t = t[0..7]
      t.join "-"
    end

  end

end
