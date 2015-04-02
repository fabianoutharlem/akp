Brand.create!([
  {id: 9, name: "Volkswagen", description: nil},
  {id: 10, name: "Skoda", description: nil},
  {id: 11, name: "Peugeot", description: nil},
  {id: 12, name: "Renault", description: nil},
  {id: 13, name: "Mercedes", description: nil}
])
Model.create!([
  {brand_id: 1, name: "E klasse"},
  {brand_id: 9, name: "Polo"},
  {brand_id: 9, name: "Golf"},
  {brand_id: 9, name: "Passat"},
  {brand_id: 13, name: "E klasse"},
  {brand_id: 13, name: "C klasse"},
  {brand_id: 10, name: "Yeti"},
  {brand_id: 11, name: "106"},
  {brand_id: 11, name: "107"},
  {brand_id: 11, name: "206"},
  {brand_id: 12, name: "Megan"},
  {brand_id: 12, name: "Scenic"}
])
