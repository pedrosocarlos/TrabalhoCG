#version 3.7;
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc" 
#include "shapes3.inc"  
#include "stones.inc"
//--------------------------------------------------------------------------

// CAMERA
#declare Camera_0 = camera {angle 75//front view
                            location  <0.0 , 5.5 ,-3.5>
                            right     x*image_width/image_height
                            look_at   <0.0 , 3.0 , 1.0>}
                            
#declare Camera_1 = camera {angle 75//front view
                            location  <0.0 , 3.98 ,-5>
                            right     x*image_width/image_height
                            look_at   <0.0 , 3.0 , 1.0>}                            
                            
#declare Camera_2 = camera {angle 90// diagonal view
                            location  <2.0 , 5.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 4.0 , 0.0>} 
                            
#declare Camera_3 = camera {angle 90// right side view
                            location  <3.0 , 4.0 , 4.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 4.0 , 0.0>}
                            
#declare Camera_4 = camera {angle 90// top view
                            location  <0.0 , 8.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 4.0 , 0.3>} 

#declare Camera_5 = camera {// back view
                            location  <0.0 , 6.0 ,5.5>
                            right     x*image_width/image_height
                            look_at   <0.0 , 3.0 , 1.0>}

#declare Camera_6 = camera {// top view bowl
                            location  <0.0 , 6.5 ,-1>
                            right     x*image_width/image_height
                            look_at   <1.0 , 0 , 0>}                            
                            
camera{Camera_0}

// SUN
light_source{<-1500,2000,-2500> color White}

// SKY 
plane{<0,1,0>,1 hollow  
       texture{ pigment{ bozo turbulence 0.92
                         color_map { [0.00 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.50 rgb <0.20, 0.20, 1.0>*0.9]
                                     [0.70 rgb <1,1,1>]
                                     [0.85 rgb <0.25,0.25,0.25>]
                                     [1.0 rgb <0.5,0.5,0.5>]}
                        scale<1,1,1.5>*2.5  translate< 0,0,0>
                       }
                finish {ambient 1 diffuse 0} }      
       scale 10000} 
       
// fog on the ground
fog { fog_type   2
      distance   50
      color      White  
      fog_offset 0.1
      fog_alt    1.5
      turbulence 1.8
}

// GROUND
plane { <0,1,0>, 0 
        texture{ pigment{ color rgb<0.35,0.65,0.0>*0.72 }
        normal { bumps 0.75 scale 0.015 }
        finish { phong 0.1 }
        }
} 
      
      
//--------------------------------------------------------------------------
//---------------------------- objects in scene ----------------------------
//-------------------------------------------------------------------------- 

union{
//-------------------------MESA 
union{ 
    union{ //TÁBUAS
        box { <-2.0, 0.92, -2.0>,< 0.0, 0.65, 3.00> //Tábua 1         
             texture{ T_Wood34    
                normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
             }
               
              scale<1,1,1>  rotate<0,0,0>  translate<0,0,0>  
        }  
        
        box { <0.0, 0.92, -2.0>,< 2, 0.65, 3.00> //Tábua 1         
             texture{ T_Wood34    
                normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
             } 
        
              scale<1,1,1>  rotate<0,0,0>  translate<0,0,0>  
        }
    } 
    union{//PERNAS DA MESA    
        cylinder{ //Perna 1
            <-1.7, -3, -1.7>, <-1.6, 0.91, -1.7>, 0.1
            
            texture{ T_Wood34    
                    normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale 0.5 translate<0,0,0>
                   }
            scale 1 
        }         
        
        cylinder{ //Perna 2
            <1.7, -3, -1.7>, <1.6, 0.91, -1.7>, 0.1
            
            texture{ T_Wood34    
                    normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale 0.5 translate<0,0,0>
                   } 
            scale 1 
        } 
        
        cylinder{ //Perna 3
            <-1.7, -3, 2.7>, <-1.6, 0.91, 2.7>, 0.1
            
            texture{ T_Wood34    
                    normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale 0.5 translate<0,0,0>
                   }
            scale 1 
        }
         
        
        cylinder{ //Perna 4
            <1.7, -3, 2.7>, <1.6, 0.91, 2.7>, 0.1
            
            texture{ T_Wood34    
                    normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale 0.5 translate<0,0,0>
                   } 
            scale 1 
        }
    }
    union{//ornamento mesa
        difference{
            difference{
                box { <-1.6, 0.2, -1.75>,< 1.6, 0.91, -1.6>         
                     texture{ T_Wood34    
                        normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                        finish { phong 1 } 
                        rotate 25 scale 0.5 translate<0,0,0>
                     }
                     scale<1,1,1>  rotate<0,0,0>  translate<0,0,0>  
                }
                
                superellipsoid{ <3.50,0.25> 
                     texture{ T_Wood34    
                        normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                        finish { phong 1 } 
                        rotate<0,0,0> scale 0.5 translate<0,0,0>
                     }
                     scale 0.2 rotate 0 translate<-1, 0.44, -1.9>
                }
                
                superellipsoid{ <3.50,0.25> 
                     texture{ T_Wood34    
                        normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                        finish { phong 1 } 
                        rotate<0,0,0> scale 0.5 translate<0,0,0>
                     }
                     scale 0.2 rotate 0 translate<1, 0.44, -1.9>
                }
            }
            
            object{  
                 Spheroid(<-1.50,2.00,-2.00>, <2.0,1.2,2.5> )
                 
                     texture{ T_Wood34    
                        normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                        finish { phong 1 } 
                        rotate<0,0,0> scale 0.5 translate<0,0,0>
                     }
                 scale 0.15  rotate<0,0,0> translate<0.2, 0.13, -1.7>
            }
        
        }        
        box { <-1.6, 0.2, -1.75>,< 1.6, 0.91, -1.6>         
             texture{ T_Wood34    
                normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
             }
             scale<1,1,1>  rotate<0,0,0>  translate<0, 0, 4.33>  
        }
        
        box { <-1.65, 0.2, -1.75>,< -1.5, 0.91, 2.73>         
             texture{ T_Wood34    
                normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
             }
                    
             scale<1,1,1>  rotate<0,0,0>  translate<0, 0, 0>  
        }
        
        box { <-1.6, 0.2, -1.75>,< -1.45, 0.91, 2.73>         
             texture{ T_Wood34    
                normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                finish { phong 1 } 
                rotate<0,0,0> scale 0.5 translate<0,0,0>
             }
                    
             scale<1,1,1>  rotate<0,0,0>  translate<3.1, 0, 0>  
        } 
        
        union{
            torus { 0.35,0.15 
                texture{ T_Wood34    
                    normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale 0.5 translate<0,0,0>
                 }
                scale 0.25 rotate<90,0,0> translate<-0.023, 0.43, -1.78>
            }
            
            sphere { <0,0,0>, 0.1 
                texture{ T_Wood34    
                    normal { wood 0.25 scale 0.05 turbulence 0.1 rotate<0,0,0> }
                    finish { phong 1 } 
                    rotate<0,0,0> scale 0.5 translate<0,0,0>
                 }
                
                scale<1,1,1>  rotate<0,0,0>  translate<-0.026, 0.425, -1.7>  
            }
        }     
    }    
rotate 0 scale 1 translate<0,0,0>
}   
    
       
//-------------------------Caneca
union{
    difference{
        union{ //Xicara
            sphere_sweep{  //Cabo da xicara
                b_spline
                6,
                <-2, 2, 0>, .6
                <0, 0, 0>, .2
                <2, 0, 0>, .2
                <2, 4, 0>, .2
                <0, 4, 0>, .2
                <-2, 2, 0>, .6
                
                 texture { T_Grnt7
                  finish { phong 0.5 reflection{ 0.1 }} 
                   scale 1 
                     }
                 scale 0.25  rotate<0,0,0>  translate<1.2, 0.975, 1.5>      
            }    
        
            cylinder{//Corpo da xícara
                <-1, -0.2, 0>, <-1, 4.2, 0>, 1.5
                
                texture { T_Grnt7
                 normal { agate 0.15 scale 0.15}
                 finish { phong 0.5 reflection{ 0.15 }} 
                  scale 1 
                     }
                scale 0.25  rotate<0,0,0>  translate<1.2, 0.975, 1.5>          
            }
        
        }
        
        cylinder{//Parte de Dentro
            <-1, 0, 0>, <-1, 4.3, 0>, 1.35
            
            texture { T_Grnt7
             normal { agate 0.15 scale 0.15}
             finish { phong 0.5 reflection{ 0.1 }} 
              scale 1 
             } 
            scale 0.25  rotate<0,0,0>  translate<1.2, 0.975, 1.5>
             
        }        
    }
    
    cylinder{//"café"
            <-1, 2, 0>, <-1, 3, 0>, 1.35
                
            texture{ pigment{ color Black}
                normal { waves 0.5 scale 0.025  translate<0,1.35,0>}
                finish { phong 1 phong_size 10 reflection{ 0.1 } } 
            } 
            
             
            scale 0.25  rotate<0,0,0>  translate<1.2, 0.975, 1.5>     
    }     
}    

//-------------------------CHALEIRA
mesh {
    #include "..\scenes\advanced\teapot\teapot_tri.inc"
     
    texture{ T_Stone25   
        finish { phong 1 } 
        rotate<0,0,0> scale 0.5 translate<0,0,0>
    }       
    scale 0.35  rotate<-90,0,0>  translate<-1.2, 0.91, 1.3>
}

//-------------------------Xicara+pires
union{     
    union{//---pires
        cone { <0,0.5,0>,0.5,<0,0.65,0>, 0.8 
           open
           texture { pigment{ color Red }
             finish { phong 1 reflection 0.10}
            }
        
           scale <1,1,1> rotate<0,0,0> translate<0,0,0>         
        }
        
        cylinder{
            <0, 0.15, 0>, <0, 0.16, 0>, 0.5        
            texture { pigment{ color Red }
                               finish { phong 1 reflection 0.10}
                    } 
            scale 1 rotate<0,0,0> translate<0, 0.34, 0> 
        }
    }
    torus { 0.5,0.02 
        texture { pigment{ color Red }
         finish { phong 1 reflection 0.10}
        }
        scale <1,1,1> rotate<0,0,0> translate<0,0.5,0>
    }    

    union{//---xicara
        cone { <0,0.3,0>,0.6,<0,1.5,0>, 0.7 
           open
           texture { pigment{ color Red }
             finish { phong 1 reflection 0.1}
            }
        
           scale <1,1,1> rotate<0,0,0> translate<0,0,0>         
        } 
        
        cone { <0,0.3,0>,0.55,<0,1.5,0>, 0.65 
           open
           texture { pigment{ color Red }
             finish { phong 1 reflection 0.10}
            }
        
           scale <1,1,1> rotate<0,0,0> translate<0,0,0>         
        }
         
        torus { 0.68,0.03 
            texture { pigment{ color Red }
             finish { phong 1 reflection 0.10}
            }
            scale <1,1,1> rotate<0,0,0> translate<0,1.5,0>
        }              
        
        torus { 0.50,0.1 
            texture { pigment{ color Red }
             finish { phong 1 reflection 0.10}
            }
            scale <1,1,1> rotate<0,0,0> translate<0,0.3,0>
        }              
            
        sphere_sweep{  //Cabo da xicara
            b_spline
            6,
            <-2, 2, 0>, .6
            <0, 0, 0>, .2
            <2, 0, 0>, .2
            <2, 4, 0>, .2
            <0, 4, 0>, .2
            <-2, 2, 0>, .6
                    
            texture { pigment{ color Red }
             finish { phong 1 reflection 0.10}
            }
            
            scale 0.28  rotate<0,0,0>  translate<0.6, 0.38, 0>      
        }
    scale 0.9  rotate<0,0,0>  translate<0, 0.35, 0>    
    } 
scale 0.4  rotate<0,0,0>  translate<-0.8, 0.735, -0.8>    
}

//-------------------------TIJELA
union{
    difference{
        difference{
            union{
                sphere { <0,0.7,0>, 0.5 
                             texture { pigment{ color Yellow }
                                       finish { phong 1 reflection 0.00}
                             } 
                    
                              scale<1,1,1>  rotate<0,0,0>  translate<0, 0.5, 0>  
                }
                
                cylinder{
                    <0, 0, 0>, <0, 0.3, 0>, 0.2        
                    texture { pigment{ color Red }
                                       finish { phong 1 reflection 0.00}
                            } 
                    scale 1 rotate<0,0,0> translate<0, 0.72, 0> 
                }
                
            }
        
            sphere { <0, 0.7, 0>, 0.5 
                     texture { pigment{ color Blue }
                               finish { phong 1 reflection 0.00}
                     }
            
                      scale<1,1,1>  rotate<0,0,0>  translate<0, 0.55, 0>  
            }
        }    
    
        box { <-0.50, 2.00, -0.50>,< 0.50, 3.00, 0.50>   
            texture { pigment{ color Red }
                           finish { phong 1 reflection 0.00}
                    }
    
            scale <1,1,1> rotate<0,0,0> translate<0, -1, 0> 
        }

    
    scale 1.5 rotate<0,0,0> translate<0.8, -0.153, -0.8>    
    }

//-------------------------Rosquinhas
    difference{//R1 
        torus { 0.50,0.3 
            texture{ pigment{ color rgb<1,0.42,0.2>*0.5 }
                     normal { dents 6.5 scale 0.1  }
                     finish { specular 0.6 reflection{ 0.00 } }
                   }
            scale <1,1,1> rotate<0,0,0> translate<0,1,0>
        } 
        
        box { <-0.81, 0.2, -0.81>,< 0.81, 0.4, 0.81>         
            texture { pigment{ color rgb< 0.75, 0.5, 0.30> }
                       finish { phong 1 reflection 0.00}
                     }           
            scale<1,1,1>  rotate<0,0,0>  translate<0,0.5,0>
        }
    scale 0.3  rotate<0,0,0>  translate<0.8,0.735,-0.8>    
    } 

    difference{//R2 
        torus { 0.50,0.3 
            texture{ pigment{ color rgb<1,0.42,0.2>*0.5 }
                     normal { dents 6.5 scale 0.1  }
                     finish { specular 0.6 reflection{ 0.00 } }
                   }
            scale <1,1,1> rotate<0,0,0> translate<0,1,0>
        } 
        
        box { <-0.81, 0.2, -0.81>,< 0.81, 0.4, 0.81>         
            texture { pigment{ color rgb< 0.75, 0.5, 0.30> }
                       finish { phong 1 reflection 0.00}
                     }           
            scale<1,1,1>  rotate<0,0,0>  translate<0,0.5,0>
        }
    scale 0.3  rotate 45  translate<0.8,0.935,-1.28>    
    }

    difference{//R3 
        torus { 0.50,0.3 
            texture{ pigment{ color rgb<1,0.42,0.2>*0.5 }
                     normal { dents 6.5 scale 0.1  }
                     finish { specular 0.6 reflection{ 0.00 } }
                   }
            scale <1,1,1> rotate<0,0,0> translate<0,1,0>
        } 
        
        box { <-0.81, 0.2, -0.81>,< 0.81, 0.4, 0.81>         
            texture { pigment{ color rgb< 0.75, 0.5, 0.30> }
                       finish { phong 1 reflection 0.00}
                     }           
            scale<1,1,1>  rotate<0,0,0>  translate<0,0.5,0>
        }
        
    scale 0.3  rotate 135  translate<0.7,0.95, -0.3>    
    }    
}
//-------------------------Açúcar
union{
    union{
        union{//---pires
            cone { <0,0.5,0>,0.5,<0,0.65,0>, 0.8 
                open
                texture { pigment{ color Red }
                 finish { phong 1 reflection 0.00}
                }
            
                scale <1,1,1> rotate<0,0,0> translate<0,0,0>         
            }
                
            cylinder{
                <0, 0.15, 0>, <0, 0.16, 0>, 0.5        
                texture { pigment{ color Red }
                 finish { phong 1 reflection 0.00}
                    } 
                scale 1 rotate<0,0,0> translate<0, 0.34, 0> 
            }
        
            torus { 0.5,0.02 
                texture { pigment{ color Red }
                 finish { phong 1 reflection 0.00}
                }
                scale <1,1,1> rotate<0,0,0> translate<0,0.5,0>
            }
        }
        union{//açucar
              box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>   
                texture{ pigment{ color White}
                    normal { wrinkles 0.75 scale 0.1  }
                    finish { phong 1 reflection{ 0.0 } }
                }
                
                scale 0.1 rotate<0,0,0> translate<0,0.5,0> 
            }
            
            box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>   
                texture{ pigment{ color White}
                    normal { wrinkles 0.75 scale 0.1  }
                    finish { phong 1 reflection{ 0.0 } }
                }
                
                scale 0.1 rotate 0 translate<0.3,0.5,0.1> 
            }
            
            box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>   
                texture{ pigment{ color White}
                    normal { wrinkles 0.75 scale 0.1  }
                    finish { phong 1 reflection{ 0.0 } }
                }
                
                scale 0.1 rotate 0 translate<0.1,0.5,-0.3> 
            }
            
            box { <-1.00, 0.00, -1.00>,< 1.00, 2.00, 1.00>   
                texture{ pigment{ color White}
                    normal { wrinkles 0.75 scale 0.1  }
                    finish { phong 1 reflection{ 0.0 } }
                }
                
                scale 0.1 rotate 0 translate<-0.2,0.5,-0.2> 
            }
        scale 1 rotate <0,0,0> translate<0, 0, 0>    
        }
    scale 0.7 rotate <0,0,0> translate<0, 0.6, 0.4>    
    }
}        
scale 1  rotate 0  translate<0, 3, 0>
}