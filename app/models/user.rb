class User < ApplicationRecord
  # Userインスタンス（レコード）を保存する前に自分自身のemailを小文字に変換
  before_save { self.email.downcase! }
  
  # nameのバリデーション（カラを許さない、50文字以内）
  validates :name, presence: true, length: { maximum: 50 }
  
  # emailのバリデーション
  #（カラを許さない、255文字以内、使用できる文字か、重複なし）
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  
  # パスワード付きモデルに必要な機能
  has_secure_password
  
  # tasksと紐付け
  has_many :tasks
end
