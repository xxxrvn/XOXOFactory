shader_type canvas_item;
 uniform vec2 positions[101];
 uniform vec2 norms[101];
uniform float time;
uniform float width;
uniform vec4 color1 : source_color;
uniform vec4 color2 : source_color;
uniform vec4 color3 : source_color;
uniform vec4 color4 : source_color;
uniform vec4 outlinecolor : source_color;
uniform float outlinewidth;

uniform float wf1;
uniform bool quad1;
uniform bool quad2;


uniform float CUF1;
uniform float CUF2;
uniform float CUF3;
uniform float CUF4;

uniform vec4 CUC1 : source_color;
uniform vec4 CUC2 : source_color;
uniform vec4 CUC3 : source_color;
uniform vec4 CUC4 : source_color;

uniform float wf2;


uniform bool grad1b;
uniform bool grad2b;
uniform bool grad3b;
uniform float lenadjust;
uniform int combmode1;
uniform int combmode2;
uniform int combmode3;
uniform bool alphaignore;

vec4 rgb2hsv(vec4 c)
{
	vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
	vec4 p = mix(vec4(c.bg, K.wz), vec4(c.gb, K.xy), step(c.b, c.g));
	vec4 q = mix(vec4(p.xyw, c.r), vec4(c.r, p.yzx), step(p.x, c.r));

	float d = q.x - min(q.w, q.y);
	float e = 1.0e-10;
	return vec4(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x,c.w);
}
vec4 maxv(vec4 a,vec4 b){
	return vec4(max(a.x,b.x),max(a.y,b.y),max(a.z,b.z),max(a.w,b.w));
}
vec4 minv(vec4 a,vec4 b){
	return vec4(min(a.x,b.x),min(a.y,b.y),min(a.z,b.z),min(a.w,b.w));
}
vec4 maxn(vec4 a,vec4 b){
	if(length(a)>length(b))return a;
	return b;
}
vec4 powv(vec4 a,float b){
	return vec4(pow(a.x,b),pow(a.y,b),pow(a.z,b),pow(a.w,b));
}
vec4 minn(vec4 a,vec4 b){
	if(length(a)>length(b))return b;
	return a;
}
float triwave(float a){
	return 2.*abs(a-floor(a+0.5));
}
float circwave(float a){
	return (-sign(mod(a,4.)-2.))*pow(1.-pow(mod(a,2.)-1.,2.),0.5)/2.+0.5;
}
float squircwave(float a,float b){
	return (-sign(mod(abs(a),4.)-2.))*pow(1.-pow(mod(abs(a),2.)-1.,b),1./b)/2.+0.5;
}
float squircbounce(float a,float b){
	return abs(pow(1.-pow(mod(abs(a),2.)-1.,b),1./b));
}
float bouncewave(float a){
	return abs(pow(1.-pow(mod(a,2.)-1.,2.),0.5));
}
float sinbounce(float a){
	return abs(sin(a*PI*2.));
}
float quadwave(float a){
	if(int(a)%2==0)return 0.;
	return 1.;
}
float parasaw(float a, float b,float c){
	return pow(mod(pow(mod(a,1.),b)*sign(mod(a,2.)-1.),1.),c);
}
vec4 binClamp(vec4 a, int flags,float mins,float maxs){
	vec4 c=a;
	if((flags&1)!=0){
		c.x=clamp(a.x,mins,maxs);
	}
	if((flags&2)!=0){
		c.y=clamp(a.y,mins,maxs);
	}
	if((flags&4)!=0){
		c.z=clamp(a.z,mins,maxs);
	}
	if((flags&8)!=0){
		c.w=clamp(a.w,mins,maxs);
	}
	return c;
}
vec4 binMod(vec4 a, int flags,float mods){
	vec4 c=a;
	if((flags&1)!=0){
		c.x=mod(a.x,mods);
	}
	if((flags&2)!=0){
		c.y=mod(a.y,mods);
	}
	if((flags&4)!=0){
		c.z=mod(a.z,mods);
	}
	if((flags&8)!=0){
		c.w=mod(a.w,mods);
	}
	return c;
}
float muffin(float factor,float dist){
	return max(abs(1.-dist/factor),0.)*factor;
}

float smoother(float a,int b){
	int ix=0;
	while(ix<=b){
	a = 1. / (1. + a);
	a = (a - 0.5) / (1.0 - 0.5);
	a=1.-a;
	ix++;
	}
	return a;
}
vec2 rotn(vec2 dis, vec2 dir) {
	return vec2(
		dir.x * dis.x - dir.y * dis.y,
		dir.y * dis.x + dir.x * dis.y 
	);
}
vec4 hsv2rgb(vec4 c)
{
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return vec4(c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y),c.w);
}
vec4 hue_shift(vec4 a, float b){
	vec4 hsv=rgb2hsv(a);
	hsv.x+=b;
	return hsv2rgb(hsv);
}

float rep(float b,float r,int rept,float extra,float extra2){
	if(rept==0)return b*r;
	if (rept==1)return triwave(b*r);
	if (rept==2)return sin(b*r*PI*2.)/2.+0.5;
	if (rept==3)return circwave(b*r*2.);
	if (rept==4)return quadwave(b*r*2.);
	if (rept==5)return mod(b*r,1.);
	if (rept==6)return bouncewave(b*r*2.);
	if (rept==7)return sinbounce(b*r);
	if (rept==8)return squircwave(b*r,extra);
	if (rept==9)return squircbounce(b*r,extra);
	if (rept==10)return parasaw(b*r,extra,extra2);
	
	
	
	return b;
}
float pochhammer(float a,int b){
	int n=0;
	float c=a;
	while(n>=b){
		c=pow(c,a);
	}
	return c;
}
float steps(float a,float b){
	return floor(a/b)*b;
}
void fragment() {
	float CRF1=0.;
	float CRF2=0.;
	float CRF3=0.;
	float CRF4=0.;
	float IRF1=0.;
	float IRF2=0.;
	float IRF3=0.;
	float IRF4=0.;
	vec4 CRC1=vec4(0);
	vec4 CRC2=vec4(0);
	vec4 CRC3=vec4(0);
	vec4 CRC4=vec4(0);
	vec4 IRC1=vec4(0);
	vec4 IRC2=vec4(0);
	vec4 IRC3=vec4(0);
	vec4 IRC4=vec4(0);
	float online=0.;
	float distance =  1e10; // Start with a very large distance
	float len=0.;
	vec2 rot=vec2(0);
	int n = 0;
	vec2 pos=vec2(0);
	vec2 norm=vec2(0);
	vec2 onorm=vec2(0);
	bool endpoint=false;
	bool isquad=false;
	vec2 uv=UV/TEXTURE_PIXEL_SIZE;
	int nu=0;
	endpoint=false;
	while (n <= 101-1) {
		vec2 offset=uv-positions[n];
		float d = length(offset);
		vec2 nod=vec2(dot(offset,norms[n]),dot(offset,vec2(-norms[n].y,norms[n].x)));
		
		if(n!=0)len+=length(positions[n]-positions[n-1]);
		if (d < distance && nod.y>0. ||n==0) {
			endpoint=false;
			distance = d;
			pos=positions[n];
			norm=norms[n];
			onorm=vec2(-norms[n].y,norms[n].x);
			nu=n;
			if(n==101-1){
				float d1=length(positions[101-1]-positions[101-2]);
				float d2=length(uv-positions[101-2]);
				if(d2>d1)endpoint=true;
				if(quad2){endpoint=false;}
				}
			if(n==0){
				float d1=length(positions[0]-positions[1]);
				float d2=length(uv-positions[1]);
				if(d2/2.>d1)endpoint=true;
				if(quad1){endpoint=false;}
				}
			online=len+(dot(offset,onorm));
			
		}
		
		n += 1;
	}
	float fac=dot(uv-pos,norm);
	if(!quad1){
		if(online<=0.){fac=length(vec2(abs(fac),online));}
	}else{
		if(online<=width){fac=max(abs(fac),width/2.-online);}
	}
	if(!quad2){
		if(online>=len){fac=length(vec2(abs(fac),online-len));}
	}else{
		if(online>=len-width){fac=max(abs(fac),online-len+width/2.);}
	}
	float fac1=abs(fac);
	float fac2=abs(fac);
	
	/**/
	if(grad1b){fac1=pow(1.+2./(wf1*width),fac1)/2.;}
	else fac1=fac1/(wf1*width)*2.;
	float onlineO=online;
	fac1=max(fac1,0.);
	fac1=min(fac1,1.);
	
	


fac1=fac1-time/10.;



fac1=rep(fac1,1.000000,3,1.000000,1.000000);

		
		
	if(grad2b){fac2=pow(1.+2./(wf2*width),fac2)/2.;}
	else fac2=fac2/(wf2*width)*2.;
	
	fac2=max(fac2,0.);
	fac2=min(fac2,1.);
	

	


fac2=fac2-time/9.;



fac2=rep(fac2,1.000000,3,1.000000,1.000000);

	
	if(grad3b)
	online=pow(1.+1./len,online);
	else online/=len;
	
	online*=pow(float(nu+4)/float(101+4),lenadjust);



online=online+dot(pos,SCREEN_UV)/10.;



online=rep(online,1.000000,3,1.000000,1.000000);

		
	vec4 color1x=color1;
	vec4 color2x=color2;
	vec4 color3x=color3;
	vec4 color4x=color4;
	vec4 colora=color1;
	
	



	IRC1=rgb2hsv(color1x);
	IRC2=rgb2hsv(color2x);
	colora=mix(IRC1,IRC2,fac1);
	colora=hsv2rgb(colora);
	





vec4 colorb=color3;
	
	



	IRC1=rgb2hsv(color3x);
	IRC2=rgb2hsv(color4x);
	colorb=mix(IRC1,IRC2,fac2);
	colorb=hsv2rgb(colorb);
	





vec4 color=colora;





	IRC1=rgb2hsv(colora);
	IRC2=rgb2hsv(colorb);
	color=mix(IRC1,IRC2,online);
	color=hsv2rgb(color);
	





color=hue_shift(color,rep(time,1.000000,0,1.000000,1.000000)*1.000000);


		
	if(alphaignore)color.w=1.;
	
	if(abs(fac)>=width/2.-outlinewidth*2.){color=outlinecolor;}

	COLOR = color;
}
