# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140625211453) do

  create_table "agtAgentTypes", :primary_key => "agentTypeID", :force => true do |t|
    t.string "agentType", :limit => 50
  end

  create_table "agtAgents", :primary_key => "agentID", :force => true do |t|
    t.integer "divisionID",    :limit => 1
    t.integer "corporationID"
    t.integer "locationID"
    t.integer "level",         :limit => 1
    t.integer "quality",       :limit => 2
    t.integer "agentTypeID"
    t.boolean "isLocator"
  end

  add_index "agtagents", ["corporationID"], :name => "agtAgents_IX_corporation"
  add_index "agtagents", ["locationID"], :name => "agtAgents_IX_station"

  create_table "agtResearchAgents", :id => false, :force => true do |t|
    t.integer "agentID", :null => false
    t.integer "typeID",  :null => false
  end

  add_index "agtresearchagents", ["typeID"], :name => "agtResearchAgents_IX_type"

  create_table "certCerts", :primary_key => "certID", :force => true do |t|
    t.text    "description"
    t.integer "groupid"
    t.string  "name"
  end

  create_table "certMasteries", :id => false, :force => true do |t|
    t.integer "typeID"
    t.integer "masteryLevel"
    t.integer "certID"
  end

  create_table "certSkills", :id => false, :force => true do |t|
    t.integer "certID"
    t.integer "skillID"
    t.integer "certLevelInt"
    t.integer "skillLevel"
    t.string  "certLevelText", :limit => 8
  end

  create_table "chrAncestries", :primary_key => "ancestryID", :force => true do |t|
    t.string  "ancestryName",     :limit => 100
    t.integer "bloodlineID",      :limit => 1
    t.string  "description",      :limit => 1000
    t.integer "perception",       :limit => 1
    t.integer "willpower",        :limit => 1
    t.integer "charisma",         :limit => 1
    t.integer "memory",           :limit => 1
    t.integer "intelligence",     :limit => 1
    t.integer "iconID"
    t.string  "shortDescription", :limit => 500
  end

  create_table "chrAttributes", :primary_key => "attributeID", :force => true do |t|
    t.string  "attributeName",    :limit => 100
    t.string  "description",      :limit => 1000
    t.integer "iconID"
    t.string  "shortDescription", :limit => 500
    t.string  "notes",            :limit => 500
  end

  create_table "chrBloodlines", :primary_key => "bloodlineID", :force => true do |t|
    t.string  "bloodlineName",          :limit => 100
    t.integer "raceID",                 :limit => 1
    t.string  "description",            :limit => 1000
    t.string  "maleDescription",        :limit => 1000
    t.string  "femaleDescription",      :limit => 1000
    t.integer "shipTypeID"
    t.integer "corporationID"
    t.integer "perception",             :limit => 1
    t.integer "willpower",              :limit => 1
    t.integer "charisma",               :limit => 1
    t.integer "memory",                 :limit => 1
    t.integer "intelligence",           :limit => 1
    t.integer "iconID"
    t.string  "shortDescription",       :limit => 500
    t.string  "shortMaleDescription",   :limit => 500
    t.string  "shortFemaleDescription", :limit => 500
  end

  create_table "chrFactions", :primary_key => "factionID", :force => true do |t|
    t.string  "factionName",          :limit => 100
    t.string  "description",          :limit => 1000
    t.integer "raceIDs"
    t.integer "solarSystemID"
    t.integer "corporationID"
    t.float   "sizeFactor"
    t.integer "stationCount",         :limit => 2
    t.integer "stationSystemCount",   :limit => 2
    t.integer "militiaCorporationID"
    t.integer "iconID"
  end

  create_table "chrRaces", :primary_key => "raceID", :force => true do |t|
    t.string  "raceName",         :limit => 100
    t.string  "description",      :limit => 1000
    t.integer "iconID"
    t.string  "shortDescription", :limit => 500
  end

  create_table "crpActivities", :primary_key => "activityID", :force => true do |t|
    t.string "activityName", :limit => 100
    t.string "description",  :limit => 1000
  end

  create_table "crpNPCCorporationDivisions", :id => false, :force => true do |t|
    t.integer "corporationID",              :null => false
    t.integer "divisionID",    :limit => 1, :null => false
    t.integer "size",          :limit => 1
  end

  create_table "crpNPCCorporationResearchFields", :id => false, :force => true do |t|
    t.integer "skillID",       :null => false
    t.integer "corporationID", :null => false
  end

  create_table "crpNPCCorporationTrades", :id => false, :force => true do |t|
    t.integer "corporationID", :null => false
    t.integer "typeID",        :null => false
  end

  create_table "crpNPCCorporations", :primary_key => "corporationID", :force => true do |t|
    t.string  "size",               :limit => 1
    t.string  "extent",             :limit => 1
    t.integer "solarSystemID"
    t.integer "investorID1"
    t.integer "investorShares1",    :limit => 1
    t.integer "investorID2"
    t.integer "investorShares2",    :limit => 1
    t.integer "investorID3"
    t.integer "investorShares3",    :limit => 1
    t.integer "investorID4"
    t.integer "investorShares4",    :limit => 1
    t.integer "friendID"
    t.integer "enemyID"
    t.integer "publicShares",       :limit => 8
    t.integer "initialPrice"
    t.float   "minSecurity"
    t.boolean "scattered"
    t.integer "fringe",             :limit => 1
    t.integer "corridor",           :limit => 1
    t.integer "hub",                :limit => 1
    t.integer "border",             :limit => 1
    t.integer "factionID"
    t.float   "sizeFactor"
    t.integer "stationCount",       :limit => 2
    t.integer "stationSystemCount", :limit => 2
    t.string  "description",        :limit => 4000
    t.integer "iconID"
  end

  create_table "crpNPCDivisions", :primary_key => "divisionID", :force => true do |t|
    t.string "divisionName", :limit => 100
    t.string "description",  :limit => 1000
    t.string "leaderType",   :limit => 100
  end

  create_table "crtCategories", :primary_key => "categoryID", :force => true do |t|
    t.string "description",  :limit => 1000
    t.string "categoryName", :limit => 512
  end

  create_table "crtCertificates", :primary_key => "certificateID", :force => true do |t|
    t.integer "categoryID",  :limit => 1
    t.integer "classID"
    t.integer "grade",       :limit => 1
    t.integer "corpID"
    t.integer "iconID"
    t.string  "description", :limit => 1000
  end

  add_index "crtcertificates", ["categoryID"], :name => "crtCertificates_IX_category"
  add_index "crtcertificates", ["classID"], :name => "crtCertificates_IX_class"

  create_table "crtClasses", :primary_key => "classID", :force => true do |t|
    t.string "description", :limit => 1000
    t.string "className",   :limit => 512
  end

  create_table "crtRecommendations", :primary_key => "recommendationID", :force => true do |t|
    t.integer "shipTypeID"
    t.integer "certificateID"
    t.integer "recommendationLevel", :limit => 1, :default => 0, :null => false
  end

  add_index "crtrecommendations", ["certificateID"], :name => "crtRecommendations_IX_certificate"
  add_index "crtrecommendations", ["shipTypeID"], :name => "crtRecommendations_IX_shipType"

  create_table "crtRelationships", :primary_key => "relationshipID", :force => true do |t|
    t.integer "parentID"
    t.integer "parentTypeID"
    t.integer "parentLevel",  :limit => 1
    t.integer "childID"
  end

  add_index "crtrelationships", ["childID"], :name => "crtRelationships_IX_child"
  add_index "crtrelationships", ["parentID"], :name => "crtRelationships_IX_parent"

  create_table "dgmAttributeCategories", :primary_key => "categoryID", :force => true do |t|
    t.string "categoryName",        :limit => 50
    t.string "categoryDescription", :limit => 200
  end

  create_table "dgmAttributeTypes", :primary_key => "attributeID", :force => true do |t|
    t.string  "attributeName", :limit => 100
    t.string  "description",   :limit => 1000
    t.integer "iconID"
    t.float   "defaultValue"
    t.boolean "published"
    t.string  "displayName",   :limit => 100
    t.integer "unitID",        :limit => 1
    t.boolean "stackable"
    t.boolean "highIsGood"
    t.integer "categoryID",    :limit => 1
  end

  create_table "dgmEffects", :primary_key => "effectID", :force => true do |t|
    t.string  "effectName",                     :limit => 400
    t.integer "effectCategory",                 :limit => 2
    t.integer "preExpression"
    t.integer "postExpression"
    t.string  "description",                    :limit => 1000
    t.string  "guid",                           :limit => 60
    t.integer "iconID"
    t.boolean "isOffensive"
    t.boolean "isAssistance"
    t.integer "durationAttributeID",            :limit => 2
    t.integer "trackingSpeedAttributeID",       :limit => 2
    t.integer "dischargeAttributeID",           :limit => 2
    t.integer "rangeAttributeID",               :limit => 2
    t.integer "falloffAttributeID",             :limit => 2
    t.boolean "disallowAutoRepeat"
    t.boolean "published"
    t.string  "displayName",                    :limit => 100
    t.boolean "isWarpSafe"
    t.boolean "rangeChance"
    t.boolean "electronicChance"
    t.boolean "propulsionChance"
    t.integer "distribution",                   :limit => 1
    t.string  "sfxName",                        :limit => 20
    t.integer "npcUsageChanceAttributeID",      :limit => 2
    t.integer "npcActivationChanceAttributeID", :limit => 2
    t.integer "fittingUsageChanceAttributeID",  :limit => 2
  end

  create_table "dgmTypeAttributes", :id => false, :force => true do |t|
    t.integer "typeID",                   :null => false
    t.integer "attributeID", :limit => 2, :null => false
    t.integer "valueInt"
    t.float   "valueFloat"
  end

  create_table "dgmTypeEffects", :id => false, :force => true do |t|
    t.integer "typeID",                 :null => false
    t.integer "effectID",  :limit => 2, :null => false
    t.boolean "isDefault"
  end

  create_table "eveIcons", :primary_key => "iconID", :force => true do |t|
    t.string "iconFile",    :limit => 500, :null => false
    t.text   "description"
  end

  create_table "eveUnits", :primary_key => "unitID", :force => true do |t|
    t.string "unitName",    :limit => 100
    t.string "displayName", :limit => 50
    t.string "description", :limit => 1000
  end

  create_table "invBlueprintTypes", :primary_key => "blueprintTypeID", :force => true do |t|
    t.integer "parentBlueprintTypeID"
    t.integer "productTypeID"
    t.integer "productionTime"
    t.integer "techLevel",                :limit => 2
    t.integer "researchProductivityTime"
    t.integer "researchMaterialTime"
    t.integer "researchCopyTime"
    t.integer "researchTechTime"
    t.integer "productivityModifier"
    t.integer "materialModifier",         :limit => 2
    t.integer "wasteFactor",              :limit => 2
    t.integer "maxProductionLimit"
  end

  create_table "invCategories", :primary_key => "categoryID", :force => true do |t|
    t.string  "categoryName", :limit => 100
    t.string  "description",  :limit => 3000
    t.integer "iconID"
    t.boolean "published"
  end

  create_table "invContrabandTypes", :id => false, :force => true do |t|
    t.integer "factionID",        :null => false
    t.integer "typeID",           :null => false
    t.float   "standingLoss"
    t.float   "confiscateMinSec"
    t.float   "fineByValue"
    t.float   "attackMinSec"
  end

  add_index "invcontrabandtypes", ["typeID"], :name => "invContrabandTypes_IX_type"

  create_table "invControlTowerResourcePurposes", :primary_key => "purpose", :force => true do |t|
    t.string "purposeText", :limit => 100
  end

  create_table "invControlTowerResources", :id => false, :force => true do |t|
    t.integer "controlTowerTypeID",              :null => false
    t.integer "resourceTypeID",                  :null => false
    t.integer "purpose",            :limit => 1
    t.integer "quantity"
    t.float   "minSecurityLevel"
    t.integer "factionID"
  end

  create_table "invFlags", :primary_key => "flagID", :force => true do |t|
    t.string  "flagName", :limit => 200
    t.string  "flagText", :limit => 100
    t.integer "orderID"
  end

  create_table "invGroups", :primary_key => "groupID", :force => true do |t|
    t.integer "categoryID"
    t.string  "groupName",            :limit => 100
    t.string  "description",          :limit => 3000
    t.integer "iconID"
    t.boolean "useBasePrice"
    t.boolean "allowManufacture"
    t.boolean "allowRecycler"
    t.boolean "anchored"
    t.boolean "anchorable"
    t.boolean "fittableNonSingleton"
    t.boolean "published"
  end

  add_index "invgroups", ["categoryID"], :name => "invGroups_IX_category"

  create_table "invItems", :primary_key => "itemID", :force => true do |t|
    t.integer "typeID",                  :null => false
    t.integer "ownerID",                 :null => false
    t.integer "locationID", :limit => 8, :null => false
    t.integer "flagID",     :limit => 2, :null => false
    t.integer "quantity",                :null => false
  end

  add_index "invitems", ["locationID"], :name => "items_IX_Location"
  add_index "invitems", ["ownerID", "locationID"], :name => "items_IX_OwnerLocation"

  create_table "invMarketGroups", :primary_key => "marketGroupID", :force => true do |t|
    t.integer "parentGroupID"
    t.string  "marketGroupName", :limit => 100
    t.string  "description",     :limit => 3000
    t.integer "iconID"
    t.boolean "hasTypes"
  end

  create_table "invMetaGroups", :primary_key => "metaGroupID", :force => true do |t|
    t.string  "metaGroupName", :limit => 100
    t.string  "description",   :limit => 1000
    t.integer "iconID"
  end

  create_table "invMetaTypes", :primary_key => "typeID", :force => true do |t|
    t.integer "parentTypeID"
    t.integer "metaGroupID",  :limit => 2
  end

  create_table "invNames", :primary_key => "itemID", :force => true do |t|
    t.string "itemName", :limit => 200, :null => false
  end

  create_table "invPositions", :primary_key => "itemID", :force => true do |t|
    t.float "x",                   :default => 0.0, :null => false
    t.float "y",                   :default => 0.0, :null => false
    t.float "z",                   :default => 0.0, :null => false
    t.float "yaw",   :limit => 24
    t.float "pitch", :limit => 24
    t.float "roll",  :limit => 24
  end

  create_table "invTraits", :id => false, :force => true do |t|
    t.integer "typeID"
    t.integer "skillID"
    t.float   "bonus"
    t.text    "bonusText"
    t.integer "unitID"
  end

  create_table "invTypeMaterials", :id => false, :force => true do |t|
    t.integer "typeID",                        :null => false
    t.integer "materialTypeID",                :null => false
    t.integer "quantity",       :default => 0, :null => false
  end

  create_table "invTypeReactions", :id => false, :force => true do |t|
    t.integer "reactionTypeID",              :null => false
    t.boolean "input",                       :null => false
    t.integer "typeID",                      :null => false
    t.integer "quantity",       :limit => 2
  end

  create_table "invTypes", :primary_key => "typeID", :force => true do |t|
    t.integer "groupID"
    t.string  "typeName",            :limit => 100
    t.string  "description",         :limit => 3000
    t.float   "mass"
    t.float   "volume"
    t.float   "capacity"
    t.integer "portionSize"
    t.integer "raceID",              :limit => 1
    t.decimal "basePrice",                           :precision => 19, :scale => 4
    t.boolean "published"
    t.integer "marketGroupID"
    t.float   "chanceOfDuplicating"
  end

  add_index "invtypes", ["groupID"], :name => "invTypes_IX_Group"

  create_table "invUniqueNames", :primary_key => "itemID", :force => true do |t|
    t.string  "itemName", :limit => 200, :null => false
    t.integer "groupID"
  end

  add_index "invuniquenames", ["groupID", "itemName"], :name => "invUniqueNames_IX_GroupName"
  add_index "invuniquenames", ["itemName"], :name => "invUniqueNames_UQ", :unique => true

  create_table "jumps", :force => true do |t|
    t.string   "current_time"
    t.string   "data_time"
    t.string   "cached_until",                :null => false
    t.integer  "system_id",                   :null => false
    t.integer  "ship_jumps",   :default => 0, :null => false
    t.integer  "eve_api",      :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  add_index "jumps", ["system_id"], :name => "index_jumps_on_system_id"

  create_table "mapCelestialStatistics", :primary_key => "celestialID", :force => true do |t|
    t.float   "temperature"
    t.text    "spectralClass",  :limit => 2147483647
    t.float   "luminosity"
    t.float   "age"
    t.float   "life"
    t.float   "orbitRadius"
    t.float   "eccentricity"
    t.float   "massDust"
    t.float   "massGas"
    t.integer "fragmented"
    t.float   "density"
    t.float   "surfaceGravity"
    t.float   "escapeVelocity"
    t.float   "orbitPeriod"
    t.float   "rotationRate"
    t.integer "locked"
    t.integer "pressure"
    t.integer "radius"
    t.integer "mass"
  end

  create_table "mapConstellationJumps", :id => false, :force => true do |t|
    t.integer "fromRegionID",        :limit => 8
    t.integer "fromConstellationID", :limit => 8, :default => 0, :null => false
    t.integer "toConstellationID",   :limit => 8, :default => 0, :null => false
    t.integer "toRegionID",          :limit => 8
  end

  create_table "mapConstellations", :primary_key => "constellationID", :force => true do |t|
    t.integer "regionID"
    t.text    "constellationName", :limit => 2147483647
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.float   "xMin"
    t.float   "xMax"
    t.float   "yMin"
    t.float   "yMax"
    t.float   "zMin"
    t.float   "zMax"
    t.integer "factionID"
    t.float   "radius"
  end

  add_index "mapconstellations", ["regionID"], :name => "mapConstellations_IX_region"

  create_table "mapDenormalize", :primary_key => "itemID", :force => true do |t|
    t.integer "typeID"
    t.integer "groupID"
    t.integer "solarSystemID"
    t.integer "constellationID"
    t.integer "regionID"
    t.integer "orbitID"
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.float   "radius"
    t.text    "itemName",        :limit => 2147483647
    t.float   "security"
    t.integer "celestialIndex"
    t.integer "orbitIndex"
  end

  add_index "mapdenormalize", ["constellationID"], :name => "mapDenormalize_IX_constellation"
  add_index "mapdenormalize", ["groupID", "constellationID"], :name => "mapDenormalize_IX_groupConstellation"
  add_index "mapdenormalize", ["groupID", "regionID"], :name => "mapDenormalize_IX_groupRegion"
  add_index "mapdenormalize", ["groupID", "solarSystemID"], :name => "mapDenormalize_IX_groupSystem"
  add_index "mapdenormalize", ["orbitID"], :name => "mapDenormalize_IX_orbit"
  add_index "mapdenormalize", ["regionID"], :name => "mapDenormalize_IX_region"
  add_index "mapdenormalize", ["solarSystemID"], :name => "mapDenormalize_IX_system"

  create_table "mapJumps", :primary_key => "stargateID", :force => true do |t|
    t.integer "destinationID", :limit => 8
  end

  create_table "mapLandmarks", :primary_key => "landmarkID", :force => true do |t|
    t.text    "landmarkName", :limit => 2147483647
    t.text    "description",  :limit => 2147483647
    t.integer "locationID",   :limit => 8
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.integer "iconID",       :limit => 8
  end

  create_table "mapLocationScenes", :primary_key => "locationID", :force => true do |t|
    t.integer "graphicID"
  end

  create_table "mapLocationWormholeClasses", :primary_key => "locationID", :force => true do |t|
    t.integer "wormholeClassID"
  end

  create_table "mapRegionJumps", :id => false, :force => true do |t|
    t.integer "fromRegionID", :limit => 8, :default => 0, :null => false
    t.integer "toRegionID",   :limit => 8, :default => 0, :null => false
  end

  create_table "mapRegions", :primary_key => "regionID", :force => true do |t|
    t.text    "regionName", :limit => 2147483647
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.float   "xMin"
    t.float   "xMax"
    t.float   "yMin"
    t.float   "yMax"
    t.float   "zMin"
    t.float   "zMax"
    t.integer "factionID"
    t.float   "radius"
  end

  add_index "mapregions", ["regionID"], :name => "mapRegions_IX_region"

  create_table "mapSolarSystemJumps", :id => false, :force => true do |t|
    t.integer "fromRegionID",        :limit => 8
    t.integer "fromConstellationID", :limit => 8
    t.integer "fromSolarSystemID",   :limit => 8, :default => 0, :null => false
    t.integer "toSolarSystemID",     :limit => 8, :default => 0, :null => false
    t.integer "toConstellationID",   :limit => 8
    t.integer "toRegionID",          :limit => 8
  end

  create_table "mapSolarSystems", :primary_key => "solarSystemID", :force => true do |t|
    t.integer "regionID"
    t.integer "constellationID"
    t.text    "solarSystemName", :limit => 2147483647
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.float   "xMin"
    t.float   "xMax"
    t.float   "yMin"
    t.float   "yMax"
    t.float   "zMin"
    t.float   "zMax"
    t.float   "luminosity"
    t.integer "border",          :limit => 1
    t.integer "fringe",          :limit => 1
    t.integer "corridor",        :limit => 1
    t.integer "hub",             :limit => 1
    t.integer "international",   :limit => 1
    t.integer "regional",        :limit => 1
    t.integer "constellation",   :limit => 1
    t.float   "security"
    t.integer "factionID"
    t.float   "radius"
    t.integer "sunTypeID"
    t.text    "securityClass",   :limit => 2147483647
  end

  add_index "mapsolarsystems", ["constellationID"], :name => "mapSolarSystems_IX_constellation"
  add_index "mapsolarsystems", ["regionID"], :name => "mapSolarSystems_IX_region"
  add_index "mapsolarsystems", ["security"], :name => "mapSolarSystems_IX_security"

  create_table "mapUniverse", :primary_key => "universeID", :force => true do |t|
    t.string "universeName", :limit => 100
    t.float  "x"
    t.float  "y"
    t.float  "z"
    t.float  "xMin"
    t.float  "xMax"
    t.float  "yMin"
    t.float  "yMax"
    t.float  "zMin"
    t.float  "zMax"
    t.float  "radius"
  end

  create_table "planetSchematics", :primary_key => "schematicID", :force => true do |t|
    t.string  "schematicName"
    t.integer "cycleTime"
  end

  create_table "planetSchematicsPinMap", :id => false, :force => true do |t|
    t.integer "schematicID", :limit => 2, :null => false
    t.integer "pinTypeID",                :null => false
  end

  create_table "planetSchematicsTypeMap", :id => false, :force => true do |t|
    t.integer "schematicID", :limit => 2, :null => false
    t.integer "typeID",                   :null => false
    t.integer "quantity",    :limit => 2
    t.boolean "isInput"
  end

  create_table "ramActivities", :primary_key => "activityID", :force => true do |t|
    t.string  "activityName", :limit => 100
    t.string  "iconNo",       :limit => 5
    t.string  "description",  :limit => 1000
    t.boolean "published"
  end

  create_table "ramAssemblyLineStations", :id => false, :force => true do |t|
    t.integer "stationID",                       :null => false
    t.integer "assemblyLineTypeID", :limit => 1, :null => false
    t.integer "quantity",           :limit => 1
    t.integer "stationTypeID"
    t.integer "ownerID"
    t.integer "solarSystemID"
    t.integer "regionID"
  end

  add_index "ramassemblylinestations", ["ownerID"], :name => "ramAssemblyLineStations_IX_owner"
  add_index "ramassemblylinestations", ["regionID"], :name => "ramAssemblyLineStations_IX_region"

  create_table "ramAssemblyLineTypeDetailPerCategory", :id => false, :force => true do |t|
    t.integer "assemblyLineTypeID", :limit => 1, :null => false
    t.integer "categoryID",                      :null => false
    t.float   "timeMultiplier"
    t.float   "materialMultiplier"
  end

  create_table "ramAssemblyLineTypeDetailPerGroup", :id => false, :force => true do |t|
    t.integer "assemblyLineTypeID", :limit => 1, :null => false
    t.integer "groupID",                         :null => false
    t.float   "timeMultiplier"
    t.float   "materialMultiplier"
  end

  create_table "ramAssemblyLineTypes", :primary_key => "assemblyLineTypeID", :force => true do |t|
    t.string  "assemblyLineTypeName",   :limit => 100
    t.string  "description",            :limit => 1000
    t.float   "baseTimeMultiplier"
    t.float   "baseMaterialMultiplier"
    t.float   "volume"
    t.integer "activityID",             :limit => 1
    t.float   "minCostPerHour"
  end

  create_table "ramAssemblyLines", :primary_key => "assemblyLineID", :force => true do |t|
    t.integer  "assemblyLineTypeID",           :limit => 1
    t.integer  "containerID"
    t.datetime "nextFreeTime"
    t.integer  "UIGroupingID",                 :limit => 1
    t.float    "costInstall"
    t.float    "costPerHour"
    t.integer  "restrictionMask",              :limit => 1
    t.float    "discountPerGoodStandingPoint"
    t.float    "surchargePerBadStandingPoint"
    t.float    "minimumStanding"
    t.float    "minimumCharSecurity"
    t.float    "minimumCorpSecurity"
    t.float    "maximumCharSecurity"
    t.float    "maximumCorpSecurity"
    t.integer  "ownerID"
    t.integer  "activityID",                   :limit => 1
  end

  add_index "ramassemblylines", ["containerID"], :name => "ramAssemblyLines_IX_container"
  add_index "ramassemblylines", ["ownerID"], :name => "ramAssemblyLines_IX_owner"

  create_table "ramInstallationTypeContents", :id => false, :force => true do |t|
    t.integer "installationTypeID",              :null => false
    t.integer "assemblyLineTypeID", :limit => 1, :null => false
    t.integer "quantity",           :limit => 1
  end

  create_table "ramTypeRequirements", :id => false, :force => true do |t|
    t.integer "typeID",                      :null => false
    t.integer "activityID",     :limit => 1, :null => false
    t.integer "requiredTypeID",              :null => false
    t.integer "quantity"
    t.float   "damagePerJob"
    t.boolean "recycle"
  end

  create_table "staOperationServices", :id => false, :force => true do |t|
    t.integer "operationID", :limit => 1, :null => false
    t.integer "serviceID",                :null => false
  end

  create_table "staOperations", :primary_key => "operationID", :force => true do |t|
    t.integer "activityID",            :limit => 1
    t.string  "operationName",         :limit => 100
    t.string  "description",           :limit => 1000
    t.integer "fringe",                :limit => 1
    t.integer "corridor",              :limit => 1
    t.integer "hub",                   :limit => 1
    t.integer "border",                :limit => 1
    t.integer "ratio",                 :limit => 1
    t.integer "caldariStationTypeID"
    t.integer "minmatarStationTypeID"
    t.integer "amarrStationTypeID"
    t.integer "gallenteStationTypeID"
    t.integer "joveStationTypeID"
  end

  create_table "staServices", :primary_key => "serviceID", :force => true do |t|
    t.string "serviceName", :limit => 100
    t.string "description", :limit => 1000
  end

  create_table "staStationTypes", :primary_key => "stationTypeID", :force => true do |t|
    t.float   "dockEntryX"
    t.float   "dockEntryY"
    t.float   "dockEntryZ"
    t.float   "dockOrientationX"
    t.float   "dockOrientationY"
    t.float   "dockOrientationZ"
    t.integer "operationID",            :limit => 1
    t.integer "officeSlots",            :limit => 1
    t.float   "reprocessingEfficiency"
    t.boolean "conquerable"
  end

  create_table "staStations", :primary_key => "stationID", :force => true do |t|
    t.integer "security",                 :limit => 2
    t.float   "dockingCostPerVolume"
    t.float   "maxShipVolumeDockable"
    t.integer "officeRentalCost"
    t.integer "operationID",              :limit => 1
    t.integer "stationTypeID"
    t.integer "corporationID"
    t.integer "solarSystemID"
    t.integer "constellationID"
    t.integer "regionID"
    t.string  "stationName",              :limit => 100
    t.float   "x"
    t.float   "y"
    t.float   "z"
    t.float   "reprocessingEfficiency"
    t.float   "reprocessingStationsTake"
    t.integer "reprocessingHangarFlag",   :limit => 1
  end

  add_index "stastations", ["constellationID"], :name => "staStations_IX_constellation"
  add_index "stastations", ["corporationID"], :name => "staStations_IX_corporation"
  add_index "stastations", ["operationID"], :name => "staStations_IX_operation"
  add_index "stastations", ["regionID"], :name => "staStations_IX_region"
  add_index "stastations", ["solarSystemID"], :name => "staStations_IX_system"
  add_index "stastations", ["stationTypeID"], :name => "staStations_IX_type"

  create_table "translationTables", :id => false, :force => true do |t|
    t.string  "sourceTable",      :limit => 200, :null => false
    t.string  "destinationTable", :limit => 200
    t.string  "translatedKey",    :limit => 200, :null => false
    t.integer "tcGroupID"
    t.integer "tcID"
  end

  create_table "trnTranslationColumns", :primary_key => "tcID", :force => true do |t|
    t.integer "tcGroupID",  :limit => 2
    t.string  "tableName",  :limit => 256, :null => false
    t.string  "columnName", :limit => 128, :null => false
    t.string  "masterID",   :limit => 128
  end

  create_table "trnTranslationLanguages", :primary_key => "numericLanguageID", :force => true do |t|
    t.string "languageID",   :limit => 50
    t.string "languageName", :limit => 200
  end

  create_table "trnTranslations", :id => false, :force => true do |t|
    t.integer "tcID",       :limit => 2,          :null => false
    t.integer "keyID",                            :null => false
    t.string  "languageID", :limit => 50,         :null => false
    t.text    "text",       :limit => 2147483647, :null => false
  end

  create_table "warCombatZoneSystems", :primary_key => "solarSystemID", :force => true do |t|
    t.integer "combatZoneID"
  end

  create_table "warCombatZones", :primary_key => "combatZoneID", :force => true do |t|
    t.string  "combatZoneName", :limit => 100
    t.integer "factionID"
    t.integer "centerSystemID"
    t.string  "description",    :limit => 500
  end

end
