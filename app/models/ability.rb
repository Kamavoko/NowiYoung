class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new  # ログインしていない場合は、からユーザーを用意し判定に用いる
    #管理者か
    if user.has_role?('superadmin')
      can :access, :rails_admin
      can :dashboard
      can :manage, :all
      #オーナーか
    elsif user.has_role?('admin')
      can :manage, :all
      #ゲストか
    else
        #読み込み可
        can :read, :all
        #コメント・写真の生成可
        can  :create, [Comment, Photo]
        #更新・削除は自分のだけ
        #can  [:update, :destroy], [Comment, Photo], :created_by => user.id
        can  [:update, :destroy], [Comment, Photo], user_id: user.id
        #ショップは見るだけ
        cannot [:create, :update, :destroy], Shop
    end
  end
end
