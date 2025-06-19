# db/migrate/20250618231811_create_solid_queue_tables.solid_queue.rb
# (Le timestamp dans le nom du fichier DOIT correspondre à celui que tu as généré : 20250618231811)

class CreateSolidQueueTables < ActiveRecord::Migration[7.1]
  def change
    create_table :solid_queue_jobs do |t|
      t.string :queue_name, null: false
      t.text :arguments
      t.string :queue_url
      t.integer :priority, default: 0, null: false
      t.references :concurrency_key, null: true, index: { unique: true }
      t.datetime :scheduled_at
      t.datetime :finished_at
      t.string :status, null: false
      t.references :job_id, null: false, index: { unique: true }
      t.string :class_name, null: false
      t.boolean :active_job_id, null: true
      t.text :error_details
      t.text :backtrace
      t.timestamps
    end

    create_table :solid_queue_blocked_executions do |t|
      t.references :job, null: false, index: { unique: true }
      t.string :concurrency_key, null: false
      t.datetime :expires_at, null: false
      t.timestamps
    end

    create_table :solid_queue_claimed_executions do |t|
      t.references :job, null: false, index: { unique: true }
      t.references :task, null: false
      t.timestamps
    end

    create_table :solid_queue_failed_executions do |t|
      t.references :job, null: false, index: { unique: true }
      t.text :error_details
      t.text :backtrace
      t.datetime :failed_at, null: false
      t.timestamps
    end

    create_table :solid_queue_ready_executions do |t|
      t.references :job, null: false, index: { unique: true }
      t.string :queue_name, null: false
      t.integer :priority, default: 0, null: false
      t.timestamps
    end

    create_table :solid_queue_scheduled_executions do |t|
      t.references :job, null: false, index: { unique: true }
      t.datetime :scheduled_at, null: false
      t.timestamps
    end

    create_table :solid_queue_semaphores do |t|
      t.string :key, null: false, index: { unique: true }
      t.integer :value, default: 1, null: false
      t.datetime :expires_at, null: false
      t.timestamps
    end
  end
end
