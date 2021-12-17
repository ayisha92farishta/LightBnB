const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'lightbnb'
});



const properties = require('./json/properties.json');
const users = require('./json/users.json');

/// Users

const getUserWithEmail = function(email) {

  return pool
      .query(`SELECT * FROM users WHERE email = $1`, [email])
      .then((result) => {
        if (result.rows.length === 0){
          return null
        }
        return result.rows[0];
      })
      .catch((err) => {
        console.log(err.message);
      });

}

exports.getUserWithEmail = getUserWithEmail;


const getUserWithId = function(id) {
  return pool
      .query(`SELECT * FROM users WHERE id = $1`, [id])
      .then((result) => {
        console.log("+++++", result.rows[0]);
        if (result.rows.length === 0){
          return null
        }
        return result.rows[0];
      })
      .catch((err) => {
        console.log(err.message);
      });

}
exports.getUserWithId = getUserWithId;




const addUser =  function(user) {
  
  return pool
      .query(`INSERT INTO users (name ,email ,password )
      VALUES ($1,$2,$3)`, [user.name,user.email,user.password])
      .then((result) => {
       
        return result.rows[0];
      })
      .catch((err) => {
        console.log(err.message);
      });

  
}
exports.addUser = addUser;

/// Reservations

const getAllReservations = function(guest_id, limit = 10) {
  return pool
    .query('SELECT reservations.id, properties.title, properties.cost_per_night, reservations.start_date, avg(rating) as average_rating FROM reservations JOIN properties ON reservations.property_id = properties.id JOIN property_reviews ON properties.id = property_reviews.property_id WHERE reservations.guest_id = $1 GROUP BY properties.id, reservations.id ORDER BY reservations.start_date LIMIT $2;', [guest_id, limit])
    .then((result) => {
      return result.rows;
    })
    .catch((err) => {
      console.log(err.message);
    });
  
 
}

exports.getAllReservations = getAllReservations;

/// Properties

const getAllProperties = function(options, limit = 10) {

  // 1
  const queryParams = [];
  // 2
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  JOIN property_reviews ON properties.id = property_id
  `;

  // 3
  if (options.city) {
    queryParams.push(`%${options.city}%`);
    queryString += `WHERE city LIKE $${queryParams.length}`;
  }
 
  if(options.owner_id) {
    queryParams.push(options.owner_id);
    queryString += `AND owner_id = $${queryParams.length}`;
  }

  if(options.minimum_price_per_night && options.maximum_price_per_night) {
    queryParams.push(options.minimum_price_per_night*100);    
    queryParams.push(options.maximum_price_per_night*100);
    queryString += `AND cost_per_night > $${queryParams.length -1} AND cos_per_night < $${queryParams.length}`;
  }
  
  if(options.minimum_rating) {
    queryParams.push(options.minimum_rating);
    queryString += `HAVING avg(property_reviews.rating) >= $${queryParams.length}`;
  }

  // 4
  queryParams.push(limit);
  queryString += `
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

  // 5
  console.log(queryString, queryParams);

  // 6
  return pool.query(queryString, queryParams).then((res) => res.rows); 
 
  };

  
exports.getAllProperties = getAllProperties;


/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function(property) {
  const propertyId = Object.keys(properties).length + 1;
  property.id = propertyId;
  properties[propertyId] = property;
  return Promise.resolve(property);
}
exports.addProperty = addProperty;

