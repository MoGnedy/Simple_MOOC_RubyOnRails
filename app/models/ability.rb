class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

#admin privilages
    if user.admin?
      can :manage, :all

#instructor privilages
    elsif user.instructor?
      can :show, User
      can :read, [Course, Lecture]
      can :upvote, Lecture
      can :downvote, Lecture
      can :manage, Course do |course|
        course.try(:user) == user
      end
        can :manage, Lecture do |lecture|
        # lecture if (Course.find(lecture.course_id).user_id) == user.id
        lecture.try(:user) == user
      end
      can :manage, Comment do |comment|
      comment.try(:user) == user
    end
    can :manage, User do |usr|
      usr == user
    end


#student privilages
    elsif user.student?
      can :show, User
      can :manage, User do |usr|
        usr.try(:usr) == user
      end
      can :read, [Course, Lecture]
      can :upvote, Lecture
      can :downvote, Lecture
      can :manage, User do |usr|
        usr == user
      end
      can :get_my_courses, Course
      can :get_my_lectures, Course
#guest
    else
      can :read, :Course
    end
  end
end
