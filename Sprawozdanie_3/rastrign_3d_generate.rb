# AUTHOR MACIEJ KRZYWDA
include Math

def Rastrign3D(x)
	if x == 0
		fx = 0
	else
		a=10
		n=100
		x1=x
		dx=(5.12 - x)/n
		fx = a*n
		
		for i in 1..n
			x = x1+ (i*dx)
			fx = fx + (x**2) - (a*Math.cos(2*PI*x))
		end
	end
	return(fx)
end

	
	puts("For arg equal -2 value Rastrign3D is #{Rastrign3D(-2)}")
	puts("For arg equal -1.8 value Rastrign3D is #{Rastrign3D(-1.8)}")
	puts("For arg equal -1.6 value Rastrign3D is #{Rastrign3D(-1.6)}")
	puts("For arg equal -1.4 value Rastrign3D is #{Rastrign3D(-1.4)}")
	puts("For arg equal -1.2 value Rastrign3D is #{Rastrign3D(-1.2)}")
	puts("For arg equal -1.0 value Rastrign3D is #{Rastrign3D(-1.0)}")
	puts("For arg equal -0.8 value Rastrign3D is #{Rastrign3D(-0.8)}")
	puts("For arg equal -0.6 value Rastrign3D is #{Rastrign3D(-0.6)}")
	puts("For arg equal -0.4 value Rastrign3D is #{Rastrign3D(-0.4)}")
	puts("For arg equal -0.2 value Rastrign3D is #{Rastrign3D(-0.2)}")
	puts("For arg equal 0 value Rastrign3D is #{Rastrign3D(0)}")
	puts("For arg equal -0.2 value Rastrign3D is #{Rastrign3D(0.2)}")
	puts("For arg equal -0.4 value Rastrign3D is #{Rastrign3D(0.4)}")
	puts("For arg equal -0.6 value Rastrign3D is #{Rastrign3D(0.6)}")
	puts("For arg equal -0.8 value Rastrign3D is #{Rastrign3D(0.8)}")
	puts("For arg equal -1.0 value Rastrign3D is #{Rastrign3D(1.0)}")
	puts("For arg equal -1.2 value Rastrign3D is #{Rastrign3D(1.2)}")
	puts("For arg equal -1.4 value Rastrign3D is #{Rastrign3D(1.4)}")
	puts("For arg equal -1.6 value Rastrign3D is #{Rastrign3D(1.6)}")
	puts("For arg equal -1.8 value Rastrign3D is #{Rastrign3D(1.8)}")
	puts("For arg equal -2 value Rastrign3D is #{Rastrign3D(2.0)}")