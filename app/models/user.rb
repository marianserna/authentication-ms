class User < ApplicationRecord

  ## Constants        ############################

  ## Attributes       ############################

  attr_accessor :access_token

  ## Extensions       ############################
  mount_uploader :image, ImageUploader

  # triggers password digest when password is set. It provides an authenticate method to check if a password is correct
  has_secure_password

  ## Relationships    ############################

  ## Validations      ############################
  validates :name, :email, :image, presence: true

  ## Callbacks        ############################

  ## Class Methods    ############################

  ## Instance Methods ############################
end
