class Credit


	def initialize(summa, term, perc, howtopay)
		@summa    = summa
		@term     = term
		@perc     = perc.to_f
		@howtopay = howtopay
	end	



	def cred
		if    @howtopay == 'annuitet'
			annuitet_calc										#вибір типу повернення
		elsif @howtopay == 'standart'
			standart_calc
		end
	end



	def annuitet_calc

		results_arr = Array.new

    perc_per_month = @perc / 100/ 12 #відсоток на місяць

    cof = perc_per_month+perc_per_month/((1+perc_per_month)**@term-1) #коофіцієнт

    full_month_pay = @summa*cof #місячний платіж

    balance = @summa 
    all_perc = 0
    all_pays = 0

    @term.times do |term|
    	repayment = balance * perc_per_month #сума оплати по відсоткам за місяць
			main_pay = full_month_pay - repayment #сума оплати по сумі в місяць
      #full_month_pay
      balance -= main_pay
      all_perc += repayment
    	all_pays += full_month_pay
    
    	results_arr << {month: term + 1, main_pay: main_pay.round(2), repayment: repayment.round(2), all_pays: full_month_pay.round(2), balance: balance.round(2)}

    end

  	results_arr << {month: '', main_pay: '', repayment: all_perc.round(2), all_pays: all_pays.round(2), balance: ''}
  end


		#summa*(((perc.to_f/100)/12)*term)
						
		#			end				
	def standart_calc
		results_arr = Array.new

		main_pay = @summa.to_f/@term 
		perc_per_month = @perc /100 /12
		balance = @summa

		all_perc = 0
		all_pays = 0

		@term.times do |term|

			repayment = balance *perc_per_month
			full_month_pay = main_pay + repayment
			balance -= main_pay

			all_perc += repayment
			all_pays += full_month_pay

			results_arr << {month: term + 1, main_pay: main_pay.round(2), repayment: repayment.round(2), all_pays: full_month_pay.round(2), balance: balance.round(2)}

    end

  	results_arr << {month: '', main_pay: '', repayment: all_perc.round(2), all_pays: all_pays.round(2), balance: ''}
  end


end


arr = Credit.new(1000, 12, 10, 'annuitet').cred

arr.each do |el|
	print el[:term]
	puts el
end