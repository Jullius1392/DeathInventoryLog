-- #!sqlite
-- #{ deathinventorylog

-- #  { init
CREATE TABLE IF NOT EXISTS death_inventory_log(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  uuid BINARY(16) NOT NULL,
  time,
  inventory BLOB NOT NULL,
  armor_inventory BLOB NOT NULL
);
-- #  }

-- #  { retrieve
-- #    :id int
SELECT id, uuid, time, inventory, armor_inventory FROM death_inventory_log WHERE id=:id;
-- #  }

-- #  { retrieve_player
-- #    :uuid string
-- #    :offset int
-- #    :length int
SELECT id, uuid, time, inventory, armor_inventory FROM death_inventory_log WHERE uuid=:uuid ORDER BY id DESC LIMIT :offset, :length;
-- #  }

-- #  { save
-- #    :uuid string
-- #    :time int
-- #    :inventory string
-- #    :armor_inventory string
INSERT INTO death_inventory_log(uuid, time, inventory, armor_inventory) VALUES(:uuid, :time, :inventory, :armor_inventory);
-- #  }

-- #}