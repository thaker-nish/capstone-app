clubs = ["LIV", "Story", "Nikki Beach"]
clubs.each do |club|
  club = Club.create(name: club,
    email: "info@#{club}.com",
    phone:"number")
end
promoters = ["Jake Johnson", "Melissa Jones", "Luke James"]
promoters.each do |promoter|
  promoter = Promoter.create(name: promoter,
    email: "#{promoter}@gmail.com",
    phone:"number",
    password:"password")
end


users = ["John Doe", "Sara Blake", "Joe Smoe"]

users.each do |user|
  user = User.create(name: user,
    email: "#{user}@gmail.com",
    phone:"number",
    password:"password")
end

users = User.all
promoters = Promoter.all

users.each do |user|
  follower = PromoterFollower.create(
      user_id: user.id,
      promoter_id: [1,2,3].sample)
end

clubs = Club.all
promoters = Promoter.all

clubs.each do |club|
  ClubPromoter.create(club_id: club.id,
    promoter_id: [1,2,3].sample)
end

promotions = ["Free drinks", "No cover", "Half priced bottles"]
promotions.each do |promotion|
  promotion = Promotion.create(name: promotion)
end

promotions = Promotion.all
clubs = Club.all
users = User.all
promoters = Promoter.all

promoters.each do |promoter|
  promoter = Guestlist.create(club_id: promoter.clubs.ids.sample ,
    promoter_id: promoters.ids.sample ,
    user_id: promoter.users.ids.sample ,
    promotion_id: [1,2,3].sample )
end
