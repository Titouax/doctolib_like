class DeleteSpecialityInDoctor < ActiveRecord::Migration[5.2]
  def change
    remove_column :doctors, :speciality, :string
  end
end
