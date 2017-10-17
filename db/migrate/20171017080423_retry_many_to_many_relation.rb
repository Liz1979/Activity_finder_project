class RetryManyToManyRelation < ActiveRecord::Migration[5.1]
  def change
    create_join_table :attractions, :activity_types do |t|
      t.index [:attraction_id, :activity_type_id], name: 'index_act_att_on_att_id_and_act_id'
      t.index [:activity_type_id, :attraction_id], name: 'index_act_att_on_act_id_and_att_id'
    end
  end
end
