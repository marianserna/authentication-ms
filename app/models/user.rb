class User < ApplicationRecord

  ## Constants        ############################

  ## Attributes       ############################

  ## Extensions       ############################
  
  # triggers password digest when password is set. It provides an authenticate method to check if a password is correct
  has_secure_password

  ## Relationships    ############################

  ## Validations      ############################
  validates :name, :email, presence: true

  ## Callbacks        ############################

  ## Class Methods    ############################

  ## Instance Methods ############################
end
