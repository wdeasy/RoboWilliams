module Bot
  module DiscordCommands
    module Wildo
      extend Discordrb::Commands::CommandContainer

      @emojis = {
        "cool" => ["🆒"],
        "free" => ["🆓"],
        "back" => ["🔙"],
        "soon" => ["🔜"],
        "off" => ["📴"],
        "sos" => ["🆘"],
        "atm" => ["🏧"],
        "new" => ["🆕"],
        "end" => ["🔚"],
        "top" => ["🔝"],
        "100" => ["💯"],
        "777" => ["🎰"],
        "zzz" => ["💤"],
        "id" => ["🆔"],
        "vs" => ["🆚"],
        "ab" => ["🆎"],
        "cl" => ["🆑"],
        "wc" => ["🚾"],
        "ng" => ["🆖"],
        "ok" => ["🆗"],
        "up" => ["🆙"],
        "on" => ["🔛"],
        "21" => ["📅"],
        "!!" => ["‼️"],
        "!?" => ["⁉️"], 
        "a" => ["🅰️"],
        "b" => ["🅱️"],
        "c" => ["🇨"],
        "d" => ["🇩"],
        "e" => ["📧"],
        "f" => ["🇫"],
        "g" => ["🇬"],
        "h" => ["🇭"],
        "i" => ["ℹ️"],
        "j" => ["🇯"],
        "k" => ["🇰"],
        "l" => ["🇱"],
        "m" => ["Ⓜ️","♏"],
        "n" => ["♑️"],
        "o" => ["🅾️"],
        "p" => ["🅿️"],
        "q" => ["🇶"],
        "r" => ["🇷"],
        "s" => ["🇸"],
        "t" => ["✝️"],
        "u" => ["⛎"],
        "v" => ["🇻"],
        "w" => ["🇼"],
        "x" => ["✖️","❎"],
        "y" => ["🇾"],
        "z" => ["🇿"],
        '0' => ["0⃣"],
        '1' => ["1⃣"],
        '2' => ["2⃣"],
        '3' => ["3⃣"],
        '4' => ["4⃣"],
        '5' => ["5⃣"],
        '6' => ["6⃣"],
        '7' => ["7⃣"],
        '8' => ["8⃣"],
        '9' => ["9⃣"],
        '#' => ["#⃣"],
        '*' => ["*⃣"],
        "!" => ["❗","❕","⚠️"],
        "?" => ["❓","❔"],
        " " => ["   "]        
      }

      command(:wildo, description: "✝️️ 🇾 🅿️️ 📧   🇱 ℹ️️ 🇰 📧   ✝️️ 🇭 ℹ️️ 🇸") do |event, *args|
        Bot.post_response(event, Wildo.build_words(args))
      end

      def self.build_words(args)
        words = []
      
        args.each do |arg|
          words << Wildo.build_word(arg.downcase)
        end
      
        Bot.clean_words(words.join('   '))
      end 

      def self.build_word(arg)  
        return arg.to_s if Bot.skip_word(arg)

        word = []

        start = 0
        finish = (arg.length-1)

        while start <= (arg.length-1)
          while finish >= start

            buffer = arg[start..finish]
            if @emojis.key?(buffer)
              word << @emojis[buffer].sample
              start = start + buffer.length
              next
            end

            if buffer.length == 1
              word << Bot.no_emoji(buffer)
              start+=1
            end

            finish-=1
          end

          finish = (arg.length-1)
        end

        return word.join(' ')
      end    
    end         
  end
end
