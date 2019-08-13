[
  {name: 'レディース'},
  {name: 'メンズ'},
  {name: 'ベビー・キッズ'},
  {name: 'インテリア・住まい・小物'},
  {name: '本・音楽・ゲーム'},
  {name: 'おもちゃ・ホビー・グッズ'},
  {name: 'コスメ・香水・美容'},
  {name: '家電・スマホ・カメラ'},
  {name: 'スポーツ・レジャー'},
  {name: 'ハンドメイド'},
  {name: 'チケット'},
  {name: '自動車・オートバイ'},
  {name: 'その他'},
 ].each do |d|
  data = Category.create(name: d[:name])

  data.name = d[:name]
  data.save
 end
