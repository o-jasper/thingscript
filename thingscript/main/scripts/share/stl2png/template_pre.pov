background{color rgb 0}

object{ draw_model
//rotate<-90,0,0>
texture{ pigment{ color rgb <0.5,0.5,0.6> }
finish { ambient 0.3
diffuse 0.85
specular 0.3 } } }

light_source { <100,-100,200> color rgb <1,1,1> }
light_source { <-100,-100,200> color rgb <0.5,0.5,1> }

camera {
perspective
angle 45
//up x
right y*image_width/image_height
