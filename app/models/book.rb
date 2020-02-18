class Book < ApplicationRecord
    enum status: [:reservation, :now_on_sale, :end_of_print]

    scope :costly, -> { where("price > ?", 3000) }
    scope :written_about, -> (theme){ where("name like ?", "%#{theme}%") }

    belongs_to :publisher

    has_many :book_authors #共著
    has_many :authors, through: :book_authors

    validates :name, presence: true
    validates :name, length: { maximum: 15 }
    validates :price, numericality: { greater_than_or_equal_to: 0 }

    # def high_price?
    #     price => 5000
    # end

    # after_destroy :if=> :high_price? do |book|
    #     Rails.logger.warn "Book with high price is deleted: #{book.attributes.inspect}"
    #     Rails.logger.warn "Please check"
    # end

    after_destroy do |book|
        Rails.logger.info "Book is deleted: #{book.attributes.inspect}"
    end

end

