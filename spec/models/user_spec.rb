require 'rails_helper'

describe User do
  let (:new_user){User.create({username: 'new_user', password: 'password', judge_status: false, email: 'user@email.com'})}