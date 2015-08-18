FactoryGirl.define do
  
  factory :valid_user, class: User do
  		name "Daddy"
  		email "testing@test.com"
  		password "password"
  		id 1


    
  end

 


  factory :null_email, class: User do
  		name "Daddy"
   		email nil
   		password "password"
  end 

  #password tests

  factory :null_password, class:  User do
  		
  		name "Daddy"
  		email "test@test.com"
  		password nil
    
  end


  factory :password_length, class:  User do
  		
  		name "Daddy"
  		email "test@test.com"
  		password "pop"
    
  end

  factory :long_password_length, class:  User do
  		
  		name "Daddy"
  		email "test@test.com"
  		password "pojahwdhagdjhawgp"
    
  end

  factory :new_session, class: User do
  		name "dad"
  		email "test@test.com"
  		password "password"
  		session id 1
  end




#no password
#limit on email
#limit on password
#must be unique email

end


