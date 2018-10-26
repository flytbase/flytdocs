from flyt_python.flyt_python import DroneApiConnector
token = ''                      # Personal Access Token
vehicle_id = ''                 # Vehicle ID

drone = DroneApiConnector(token,vehicle_id,ip_address = 'localhost', wait_for_drone_response = True)

# Initialize the drone's connection
drone.connect()

print("Taking Off")
drone.takeoff(5)

print("Drawing square with side = 5")

drone.set_local_position(x=5, y=0, z=0, body_frame=True)
drone.set_local_position(x=0, y=5, z=0, body_frame=True)
drone.set_local_position(x=-5, y=0, z=0,body_frame=True)
drone.set_local_position(x=0, y=-5, z=0,body_frame=True)

drone.land()
#disconnect the drone
drone.disconnect()
