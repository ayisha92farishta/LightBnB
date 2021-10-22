DELETE FROM users;
DELETE FROM properties;
DELETE FROM property_reviews;
DELETE FROM reservations;


INSERT INTO users (name ,email ,password )
VALUES 
  (
    'Poppy Kornikova',
    'pop.korn@email.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Lana Del Ray',
    'lana@gmail.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Sam Ford',
    's2323@gmail.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Tony Hifiger',
    't42378462@dfs.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  );

  INSERT INTO properties (
  owner_id ,
  title ,
  description ,
  thumbnail_photo_url,
  cover_photo_url,
  cost_per_night,
  parking_spaces,
  number_of_bathrooms,
  number_of_bedrooms,
  country,
  street ,
  city,
  province,
  post_code 
) VALUES 
  (
    1,
    'Town House',
    'Nice and cozy',
    'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg ',
    120,
    1,
    3,
    1.5,
    'Canada',
    'Rockville',
    'Ottawa',
    'Ontario',
    'LPS758'
  ),
  (
    2,
    'Single House',
    'Nice and cozy',
    ' https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg?auto=compress&cs=tinysrgb&h=350 ',
    'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg',
    220,
    2,
    4,
    2,
    'Canada',
    'Clarence',
    'Ottawa',
    'Ontario',
    'RFG472'
  ),
  (
    3,
    'Condo',
    'Beautiful view',
    'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg ',
    123,
    1,
    2,
    1,
    'Canada',
    'Grenon',
    'Ottawa',
    'Ontario',
    'LDR889'
  ),
  (
    4,
    'Mansion',
    'Extravagant and unecessary',
    'https://images.pexels.com/photos/1475938/pexels-photo-1475938.jpeg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/1475938/pexels-photo-1475938.jpeg ',
    687,
    12,
    8,
    9.5,
    'Canada',
    'China Town',
    'Ottawa',
    'Ontario',
    'DPY648'
    );

INSERT INTO reservations (
  start_date,
  end_date,
  property_id,
  guest_id
  )
  VALUES 
  (
    '2018-09-11',
    '2018-09-26',
    2,
    3
  ),
  (
    '2019-01-04',
    '2019-02-01',
    1,
    2
  ),  
  (
    '2021-10-01' ,
    '2021-10-14',
    4,
    3
  ),
  (
    '2014-10-21',
    '2014-10-21' ,
    1,
    4
  ),
  (
    '2016-07-17',
    '2016-08-01',
    3,
    1
  );

INSERT INTO property_reviews( guest_id , property_id ,  reservation_id , rating ) 
VALUES 
 (
   1,2,1,4
 ),
 (
   2,3,3,5
 ),
 (
   4,2,5,3
 )
