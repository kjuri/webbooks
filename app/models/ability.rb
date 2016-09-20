class Ability
  include CanCan::Ability

  def initialize(user)
    @user ||= user || User.new
    @user.roles.each { |role| send(role) }

    if @user.roles.size == 0
      can :browse, Book
    end
  end

  def admin
    can :manage, :all
  end

  def writer
    can :manage, Book, user_id: @user.id
    can :create, Book
    can :manage, Chapter, book: { user_id: @user.id }
    can :manage, Part, chapter: { book: { user_id: @user.id } }
    can :manage, DecisionPoint, part: { chapter: { book: { user_id: @user.id } } }
    can :manage, Answer, decision_pont: { part: { chapter: { book: { user_id: @user.id } } } }
  end

  def reader
    can :browse, Book
    can :read_book, Book
    can :manage, Shelf, library: { user_id: @user.id }
    can :create, Shelf
  end
end
