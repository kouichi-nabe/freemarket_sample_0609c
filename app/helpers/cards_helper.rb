module CardsHelper
  def get_card_exp_year
    {'19':'19','20':'20','21':'21','22':'22','23':'23','24':'24','25':'25','26':'26','27':'27','28':'28','29':'29'}
  end

  def get_card_exp(info)
    sprintf "%<month>02d / %{year}", month: info.exp_month, year: info.exp_year.to_s[2, 2]
  end

end
