# frozen_string_literal: true
# This migration comes from decidim_elections (originally 20200430083618)

class CreateDecidimElectionsElections < ActiveRecord::Migration[5.2]
  def change
    create_table :decidim_elections_elections do |t|
      t.jsonb :title
      t.jsonb :subtitle
      t.jsonb :description
      t.datetime :start_time
      t.datetime :end_time
      t.references :decidim_component, index: true
      t.timestamps
    end
  end
end
