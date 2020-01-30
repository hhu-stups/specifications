 MACHINE blocksworld_medium
/* CNF Translated to B */
/* 116 Variables, 930 Clauses */
/* solved by ProB in 0.160 seconds; now in 0.090 seconds in 1.3.5-beta11 */
CONSTANTS
x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x11, x12, x13, x14, x15, x16, x17, x18, x19, x20, x21, x22, x23, x24, x25, x26, x27, x28, x29, x30, x31, x32, x33, x34, x35, x36, x37, x38, x39, x40, x41, x42, x43, x44, x45, x46, x47, x48, x49, x50, x51, x52, x53, x54, x55, x56, x57, x58, x59, x60, x61, x62, x63, x64, x65, x66, x67, x68, x69, x70, x71, x72, x73, x74, x75, x76, x77, x78, x79, x80, x81, x82, x83, x84, x85, x86, x87, x88, x89, x90, x91, x92, x93, x94, x95, x96, x97, x98, x99, x100, x101, x102, x103, x104, x105, x106, x107, x108, x109, x110, x111, x112, x113, x114, x115, x116
DEFINITIONS
 PROPS == (
x1:BOOL & x2:BOOL & x3:BOOL & x4:BOOL & x5:BOOL & x6:BOOL & x7:BOOL & x8:BOOL & x9:BOOL & x10:BOOL & x11:BOOL & x12:BOOL & x13:BOOL & x14:BOOL & x15:BOOL & x16:BOOL & x17:BOOL & x18:BOOL & x19:BOOL & x20:BOOL & x21:BOOL & x22:BOOL & x23:BOOL & x24:BOOL & x25:BOOL & x26:BOOL & x27:BOOL & x28:BOOL & x29:BOOL & x30:BOOL & x31:BOOL & x32:BOOL & x33:BOOL & x34:BOOL & x35:BOOL & x36:BOOL & x37:BOOL & x38:BOOL & x39:BOOL & x40:BOOL & x41:BOOL & x42:BOOL & x43:BOOL & x44:BOOL & x45:BOOL & x46:BOOL & x47:BOOL & x48:BOOL & x49:BOOL & x50:BOOL & x51:BOOL & x52:BOOL & x53:BOOL & x54:BOOL & x55:BOOL & x56:BOOL & x57:BOOL & x58:BOOL & x59:BOOL & x60:BOOL & x61:BOOL & x62:BOOL & x63:BOOL & x64:BOOL & x65:BOOL & x66:BOOL & x67:BOOL & x68:BOOL & x69:BOOL & x70:BOOL & x71:BOOL & x72:BOOL & x73:BOOL & x74:BOOL & x75:BOOL & x76:BOOL & x77:BOOL & x78:BOOL & x79:BOOL & x80:BOOL & x81:BOOL & x82:BOOL & x83:BOOL & x84:BOOL & x85:BOOL & x86:BOOL & x87:BOOL & x88:BOOL & x89:BOOL & x90:BOOL & x91:BOOL & x92:BOOL & x93:BOOL & x94:BOOL & x95:BOOL & x96:BOOL & x97:BOOL & x98:BOOL & x99:BOOL & x100:BOOL & x101:BOOL & x102:BOOL & x103:BOOL & x104:BOOL & x105:BOOL & x106:BOOL & x107:BOOL & x108:BOOL & x109:BOOL & x110:BOOL & x111:BOOL & x112:BOOL & x113:BOOL & x114:BOOL & x115:BOOL & 
 (  x4=FALSE  or  x2=FALSE  or  x6=TRUE  ) &
   (  x4=FALSE  or  x3=FALSE  or  x7=TRUE  ) &
   (  x8=FALSE  or  x1=FALSE  or  x9=TRUE  ) &
   (  x8=FALSE  or  x3=FALSE  or  x11=TRUE  ) &
   (  x4=FALSE  or  x12=FALSE  or  x5=FALSE  ) &
   (  x8=FALSE  or  x14=FALSE  or  x10=FALSE  ) &
   (  x12=FALSE  or  x17=TRUE  ) &
   (  x13=FALSE  or  x18=TRUE  ) &
   (  x14=FALSE  or  x19=TRUE  ) &
   (  x15=FALSE  or  x20=TRUE  ) &
   (  x1=FALSE  or  x18=FALSE  ) &
   (  x2=FALSE  or  x20=FALSE  ) &
   (  x4=FALSE  or  x14=FALSE  ) &
   (  x4=FALSE  or  x15=FALSE  ) &
   (  x4=FALSE  or  x16=FALSE  ) &
   (  x8=FALSE  or  x12=FALSE  ) &
   (  x8=FALSE  or  x13=FALSE  ) &
   (  x8=FALSE  or  x16=FALSE  ) &
   (  x1=TRUE  or  x18=TRUE  ) &
   (  x2=TRUE  or  x20=TRUE  ) &
   (  x4=TRUE  or  x5=TRUE  ) &
   (  x8=TRUE  or  x10=TRUE  ) &
   (  x12=TRUE  or  x17=FALSE  ) &
   (  x14=TRUE  or  x19=FALSE  ) &
   (  x4=TRUE  or  x6=FALSE  ) &
   (  x4=TRUE  or  x7=FALSE  ) &
   (  x8=TRUE  or  x9=FALSE  ) &
   (  x8=TRUE  or  x11=FALSE  ) &
   (  x2=TRUE  or  x6=FALSE  ) &
   (  x3=TRUE  or  x7=FALSE  ) &
   (  x1=TRUE  or  x9=FALSE  ) &
   (  x3=TRUE  or  x11=FALSE  ) &
   (  x4=TRUE  or  x8=TRUE  ) &
   (  x12=TRUE  or  x13=TRUE  or  x14=TRUE  or  x15=TRUE  or  x16=TRUE  ) &
   (  x1=TRUE  or  x2=TRUE  or  x3=TRUE  ) &
   (  x4=FALSE  or  x8=FALSE  ) &
   (  x8=FALSE  or  x4=FALSE  ) &
   (  x12=FALSE  or  x13=FALSE  ) &
   (  x12=FALSE  or  x14=FALSE  ) &
   (  x12=FALSE  or  x15=FALSE  ) &
   (  x12=FALSE  or  x16=FALSE  ) &
   (  x13=FALSE  or  x12=FALSE  ) &
   (  x13=FALSE  or  x14=FALSE  ) &
   (  x13=FALSE  or  x15=FALSE  ) &
   (  x13=FALSE  or  x16=FALSE  ) &
   (  x14=FALSE  or  x12=FALSE  ) &
   (  x14=FALSE  or  x13=FALSE  ) &
   (  x14=FALSE  or  x15=FALSE  ) &
   (  x14=FALSE  or  x16=FALSE  ) &
   (  x15=FALSE  or  x12=FALSE  ) &
   (  x15=FALSE  or  x13=FALSE  ) &
   (  x15=FALSE  or  x14=FALSE  ) &
   (  x15=FALSE  or  x16=FALSE  ) &
   (  x16=FALSE  or  x12=FALSE  ) &
   (  x16=FALSE  or  x13=FALSE  ) &
   (  x16=FALSE  or  x14=FALSE  ) &
   (  x16=FALSE  or  x15=FALSE  ) &
   (  x1=FALSE  or  x2=FALSE  ) &
   (  x1=FALSE  or  x3=FALSE  ) &
   (  x2=FALSE  or  x1=FALSE  ) &
   (  x2=FALSE  or  x3=FALSE  ) &
   (  x3=FALSE  or  x1=FALSE  ) &
   (  x3=FALSE  or  x2=FALSE  ) &
   (  x4=FALSE  or  x13=FALSE  ) &
   (  x8=FALSE  or  x15=FALSE  ) &
   (  x4=FALSE  or  x1=FALSE  ) &
   (  x8=FALSE  or  x2=FALSE  ) &
   (  x13=FALSE  or  x1=FALSE  ) &
   (  x15=FALSE  or  x2=FALSE  ) &
   (  x16=FALSE  or  x3=FALSE  ) &
   (  x26=FALSE  or  x22=FALSE  or  x28=TRUE  ) &
   (  x26=FALSE  or  x23=FALSE  or  x29=TRUE  ) &
   (  x26=FALSE  or  x24=FALSE  or  x30=TRUE  ) &
   (  x26=FALSE  or  x25=FALSE  or  x31=TRUE  ) &
   (  x32=FALSE  or  x21=FALSE  or  x33=TRUE  ) &
   (  x32=FALSE  or  x23=FALSE  or  x34=TRUE  ) &
   (  x32=FALSE  or  x24=FALSE  or  x35=TRUE  ) &
   (  x32=FALSE  or  x25=FALSE  or  x36=TRUE  ) &
   (  x37=FALSE  or  x21=FALSE  or  x38=TRUE  ) &
   (  x37=FALSE  or  x22=FALSE  or  x39=TRUE  ) &
   (  x37=FALSE  or  x24=FALSE  or  x40=TRUE  ) &
   (  x37=FALSE  or  x25=FALSE  or  x41=TRUE  ) &
   (  x42=FALSE  or  x21=FALSE  or  x43=TRUE  ) &
   (  x42=FALSE  or  x22=FALSE  or  x44=TRUE  ) &
   (  x42=FALSE  or  x23=FALSE  or  x45=TRUE  ) &
   (  x42=FALSE  or  x25=FALSE  or  x46=TRUE  ) &
   (  x26=FALSE  or  x52=FALSE  or  x27=FALSE  ) &
   (  x32=FALSE  or  x47=FALSE  or  x33=FALSE  ) &
   (  x32=FALSE  or  x50=FALSE  or  x35=FALSE  ) &
   (  x32=FALSE  or  x51=FALSE  or  x36=FALSE  ) &
   (  x37=FALSE  or  x51=FALSE  or  x41=FALSE  ) &
   (  x42=FALSE  or  x48=FALSE  or  x44=FALSE  ) &
   (  x42=FALSE  or  x49=FALSE  or  x45=FALSE  ) &
   (  x42=FALSE  or  x51=FALSE  or  x46=FALSE  ) &
   (  x52=FALSE  or  x53=TRUE  ) &
   (  x47=FALSE  or  x54=TRUE  ) &
   (  x48=FALSE  or  x55=TRUE  ) &
   (  x49=FALSE  or  x56=TRUE  ) &
   (  x50=FALSE  or  x57=TRUE  ) &
   (  x21=FALSE  or  x54=FALSE  ) &
   (  x22=FALSE  or  x55=FALSE  ) &
   (  x23=FALSE  or  x56=FALSE  ) &
   (  x24=FALSE  or  x57=FALSE  ) &
   (  x26=FALSE  or  x48=FALSE  ) &
   (  x26=FALSE  or  x49=FALSE  ) &
   (  x26=FALSE  or  x50=FALSE  ) &
   (  x26=FALSE  or  x51=FALSE  ) &
   (  x32=FALSE  or  x52=FALSE  ) &
   (  x32=FALSE  or  x47=FALSE  or  x5=TRUE  ) &
   (  x32=FALSE  or  x49=FALSE  ) &
   (  x32=FALSE  or  x50=FALSE  or  x6=TRUE  ) &
   (  x32=FALSE  or  x51=FALSE  or  x7=TRUE  ) &
   (  x37=FALSE  or  x52=FALSE  ) &
   (  x37=FALSE  or  x47=FALSE  ) &
   (  x37=FALSE  or  x48=FALSE  ) &
   (  x37=FALSE  or  x50=FALSE  ) &
   (  x42=FALSE  or  x52=FALSE  ) &
   (  x42=FALSE  or  x47=FALSE  ) &
   (  x42=FALSE  or  x48=FALSE  or  x9=TRUE  ) &
   (  x42=FALSE  or  x49=FALSE  or  x10=TRUE  ) &
   (  x42=FALSE  or  x51=FALSE  or  x11=TRUE  ) &
   (  x26=FALSE  or  x17=TRUE  ) &
   (  x32=FALSE  or  x18=TRUE  ) &
   (  x37=FALSE  or  x19=TRUE  ) &
   (  x42=FALSE  or  x20=TRUE  ) &
   (  x21=FALSE  or  x17=TRUE  ) &
   (  x22=FALSE  or  x18=TRUE  ) &
   (  x23=FALSE  or  x19=TRUE  ) &
   (  x24=FALSE  or  x20=TRUE  ) &
   (  x21=TRUE  or  x17=FALSE  or  x54=TRUE  ) &
   (  x22=TRUE  or  x18=FALSE  or  x55=TRUE  ) &
   (  x23=TRUE  or  x19=FALSE  or  x56=TRUE  ) &
   (  x24=TRUE  or  x20=FALSE  or  x57=TRUE  ) &
   (  x26=TRUE  or  x27=TRUE  ) &
   (  x32=TRUE  or  x5=FALSE  or  x33=TRUE  ) &
   (  x32=TRUE  or  x6=FALSE  or  x35=TRUE  ) &
   (  x32=TRUE  or  x7=FALSE  or  x36=TRUE  ) &
   (  x37=TRUE  or  x41=TRUE  ) &
   (  x42=TRUE  or  x9=FALSE  or  x44=TRUE  ) &
   (  x42=TRUE  or  x10=FALSE  or  x45=TRUE  ) &
   (  x42=TRUE  or  x11=FALSE  or  x46=TRUE  ) &
   (  x52=TRUE  or  x53=FALSE  ) &
   (  x47=TRUE  or  x17=TRUE  or  x54=FALSE  ) &
   (  x48=TRUE  or  x18=TRUE  or  x55=FALSE  ) &
   (  x49=TRUE  or  x19=TRUE  or  x56=FALSE  ) &
   (  x50=TRUE  or  x20=TRUE  or  x57=FALSE  ) &
   (  x26=TRUE  or  x28=FALSE  ) &
   (  x26=TRUE  or  x29=FALSE  ) &
   (  x26=TRUE  or  x30=FALSE  ) &
   (  x26=TRUE  or  x31=FALSE  ) &
   (  x32=TRUE  or  x5=TRUE  or  x33=FALSE  ) &
   (  x32=TRUE  or  x34=FALSE  ) &
   (  x32=TRUE  or  x6=TRUE  or  x35=FALSE  ) &
   (  x32=TRUE  or  x7=TRUE  or  x36=FALSE  ) &
   (  x37=TRUE  or  x38=FALSE  ) &
   (  x37=TRUE  or  x39=FALSE  ) &
   (  x37=TRUE  or  x40=FALSE  ) &
   (  x42=TRUE  or  x43=FALSE  ) &
   (  x42=TRUE  or  x9=TRUE  or  x44=FALSE  ) &
   (  x42=TRUE  or  x10=TRUE  or  x45=FALSE  ) &
   (  x42=TRUE  or  x11=TRUE  or  x46=FALSE  ) &
   (  x22=TRUE  or  x28=FALSE  ) &
   (  x23=TRUE  or  x29=FALSE  ) &
   (  x24=TRUE  or  x30=FALSE  ) &
   (  x25=TRUE  or  x31=FALSE  ) &
   (  x21=TRUE  or  x5=TRUE  or  x33=FALSE  ) &
   (  x23=TRUE  or  x34=FALSE  ) &
   (  x24=TRUE  or  x6=TRUE  or  x35=FALSE  ) &
   (  x25=TRUE  or  x7=TRUE  or  x36=FALSE  ) &
   (  x21=TRUE  or  x38=FALSE  ) &
   (  x22=TRUE  or  x39=FALSE  ) &
   (  x24=TRUE  or  x40=FALSE  ) &
   (  x21=TRUE  or  x43=FALSE  ) &
   (  x22=TRUE  or  x9=TRUE  or  x44=FALSE  ) &
   (  x23=TRUE  or  x10=TRUE  or  x45=FALSE  ) &
   (  x25=TRUE  or  x11=TRUE  or  x46=FALSE  ) &
   (  x26=TRUE  or  x32=TRUE  or  x37=TRUE  or  x42=TRUE  ) &
   (  x52=TRUE  or  x47=TRUE  or  x48=TRUE  or  x49=TRUE  or  x50=TRUE  or  x51=TRUE  ) &
   (  x21=TRUE  or  x22=TRUE  or  x23=TRUE  or  x24=TRUE  or  x25=TRUE  ) &
   (  x26=FALSE  or  x32=FALSE  ) &
   (  x26=FALSE  or  x37=FALSE  ) &
   (  x26=FALSE  or  x42=FALSE  ) &
   (  x32=FALSE  or  x26=FALSE  ) &
   (  x32=FALSE  or  x37=FALSE  ) &
   (  x32=FALSE  or  x42=FALSE  ) &
   (  x37=FALSE  or  x26=FALSE  ) &
   (  x37=FALSE  or  x32=FALSE  ) &
   (  x37=FALSE  or  x42=FALSE  ) &
   (  x42=FALSE  or  x26=FALSE  ) &
   (  x42=FALSE  or  x32=FALSE  ) &
   (  x42=FALSE  or  x37=FALSE  ) &
   (  x52=FALSE  or  x47=FALSE  ) &
   (  x52=FALSE  or  x48=FALSE  ) &
   (  x52=FALSE  or  x49=FALSE  ) &
   (  x52=FALSE  or  x50=FALSE  ) &
   (  x52=FALSE  or  x51=FALSE  ) &
   (  x47=FALSE  or  x52=FALSE  ) &
   (  x47=FALSE  or  x48=FALSE  ) &
   (  x47=FALSE  or  x49=FALSE  ) &
   (  x47=FALSE  or  x50=FALSE  ) &
   (  x47=FALSE  or  x51=FALSE  ) &
   (  x48=FALSE  or  x52=FALSE  ) &
   (  x48=FALSE  or  x47=FALSE  ) &
   (  x48=FALSE  or  x49=FALSE  ) &
   (  x48=FALSE  or  x50=FALSE  ) &
   (  x48=FALSE  or  x51=FALSE  ) &
   (  x49=FALSE  or  x52=FALSE  ) &
   (  x49=FALSE  or  x47=FALSE  ) &
   (  x49=FALSE  or  x48=FALSE  ) &
   (  x49=FALSE  or  x50=FALSE  ) &
   (  x49=FALSE  or  x51=FALSE  ) &
   (  x50=FALSE  or  x52=FALSE  ) &
   (  x50=FALSE  or  x47=FALSE  ) &
   (  x50=FALSE  or  x48=FALSE  ) &
   (  x50=FALSE  or  x49=FALSE  ) &
   (  x50=FALSE  or  x51=FALSE  ) &
   (  x51=FALSE  or  x52=FALSE  ) &
   (  x51=FALSE  or  x47=FALSE  ) &
   (  x51=FALSE  or  x48=FALSE  ) &
   (  x51=FALSE  or  x49=FALSE  ) &
   (  x51=FALSE  or  x50=FALSE  ) &
   (  x21=FALSE  or  x22=FALSE  ) &
   (  x21=FALSE  or  x23=FALSE  ) &
   (  x21=FALSE  or  x24=FALSE  ) &
   (  x21=FALSE  or  x25=FALSE  ) &
   (  x22=FALSE  or  x21=FALSE  ) &
   (  x22=FALSE  or  x23=FALSE  ) &
   (  x22=FALSE  or  x24=FALSE  ) &
   (  x22=FALSE  or  x25=FALSE  ) &
   (  x23=FALSE  or  x21=FALSE  ) &
   (  x23=FALSE  or  x22=FALSE  ) &
   (  x23=FALSE  or  x24=FALSE  ) &
   (  x23=FALSE  or  x25=FALSE  ) &
   (  x24=FALSE  or  x21=FALSE  ) &
   (  x24=FALSE  or  x22=FALSE  ) &
   (  x24=FALSE  or  x23=FALSE  ) &
   (  x24=FALSE  or  x25=FALSE  ) &
   (  x25=FALSE  or  x21=FALSE  ) &
   (  x25=FALSE  or  x22=FALSE  ) &
   (  x25=FALSE  or  x23=FALSE  ) &
   (  x25=FALSE  or  x24=FALSE  ) &
   (  x26=FALSE  or  x47=FALSE  ) &
   (  x32=FALSE  or  x48=FALSE  ) &
   (  x37=FALSE  or  x49=FALSE  ) &
   (  x42=FALSE  or  x50=FALSE  ) &
   (  x26=FALSE  or  x21=FALSE  ) &
   (  x32=FALSE  or  x22=FALSE  ) &
   (  x37=FALSE  or  x23=FALSE  ) &
   (  x42=FALSE  or  x24=FALSE  ) &
   (  x47=FALSE  or  x21=FALSE  ) &
   (  x48=FALSE  or  x22=FALSE  ) &
   (  x49=FALSE  or  x23=FALSE  ) &
   (  x50=FALSE  or  x24=FALSE  ) &
   (  x51=FALSE  or  x25=FALSE  ) &
   (  x58=FALSE  or  x59=FALSE  or  x60=TRUE  ) &
   (  x58=FALSE  or  x61=FALSE  or  x62=TRUE  ) &
   (  x58=FALSE  or  x63=FALSE  or  x64=TRUE  ) &
   (  x58=FALSE  or  x65=FALSE  or  x66=TRUE  ) &
   (  x58=FALSE  or  x67=FALSE  or  x68=TRUE  ) &
   (  x69=FALSE  or  x70=FALSE  or  x71=TRUE  ) &
   (  x69=FALSE  or  x61=FALSE  or  x72=TRUE  ) &
   (  x69=FALSE  or  x63=FALSE  or  x73=TRUE  ) &
   (  x69=FALSE  or  x65=FALSE  or  x74=TRUE  ) &
   (  x69=FALSE  or  x67=FALSE  or  x75=TRUE  ) &
   (  x76=FALSE  or  x70=FALSE  or  x77=TRUE  ) &
   (  x76=FALSE  or  x59=FALSE  or  x78=TRUE  ) &
   (  x76=FALSE  or  x63=FALSE  or  x79=TRUE  ) &
   (  x76=FALSE  or  x65=FALSE  or  x80=TRUE  ) &
   (  x76=FALSE  or  x67=FALSE  or  x81=TRUE  ) &
   (  x82=FALSE  or  x70=FALSE  or  x83=TRUE  ) &
   (  x82=FALSE  or  x59=FALSE  or  x84=TRUE  ) &
   (  x82=FALSE  or  x61=FALSE  or  x85=TRUE  ) &
   (  x82=FALSE  or  x65=FALSE  or  x86=TRUE  ) &
   (  x82=FALSE  or  x67=FALSE  or  x87=TRUE  ) &
   (  x88=FALSE  or  x70=FALSE  or  x89=TRUE  ) &
   (  x88=FALSE  or  x59=FALSE  or  x90=TRUE  ) &
   (  x88=FALSE  or  x61=FALSE  or  x91=TRUE  ) &
   (  x88=FALSE  or  x63=FALSE  or  x92=TRUE  ) &
   (  x88=FALSE  or  x67=FALSE  or  x93=TRUE  ) &
   (  x58=FALSE  or  x98=FALSE  or  x68=FALSE  ) &
   (  x69=FALSE  or  x99=FALSE  or  x71=FALSE  ) &
   (  x69=FALSE  or  x95=FALSE  or  x72=FALSE  ) &
   (  x69=FALSE  or  x96=FALSE  or  x73=FALSE  ) &
   (  x69=FALSE  or  x97=FALSE  or  x74=FALSE  ) &
   (  x69=FALSE  or  x98=FALSE  or  x75=FALSE  ) &
   (  x76=FALSE  or  x94=FALSE  or  x78=FALSE  ) &
   (  x76=FALSE  or  x96=FALSE  or  x79=FALSE  ) &
   (  x76=FALSE  or  x97=FALSE  or  x80=FALSE  ) &
   (  x76=FALSE  or  x98=FALSE  or  x81=FALSE  ) &
   (  x82=FALSE  or  x94=FALSE  or  x84=FALSE  ) &
   (  x82=FALSE  or  x95=FALSE  or  x85=FALSE  ) &
   (  x82=FALSE  or  x97=FALSE  or  x86=FALSE  ) &
   (  x82=FALSE  or  x98=FALSE  or  x87=FALSE  ) &
   (  x88=FALSE  or  x94=FALSE  or  x90=FALSE  ) &
   (  x88=FALSE  or  x95=FALSE  or  x91=FALSE  ) &
   (  x88=FALSE  or  x96=FALSE  or  x92=FALSE  ) &
   (  x88=FALSE  or  x98=FALSE  or  x93=FALSE  ) &
   (  x99=FALSE  or  x100=TRUE  ) &
   (  x94=FALSE  or  x101=TRUE  ) &
   (  x95=FALSE  or  x102=TRUE  ) &
   (  x96=FALSE  or  x103=TRUE  ) &
   (  x97=FALSE  or  x104=TRUE  ) &
   (  x70=FALSE  or  x100=FALSE  ) &
   (  x59=FALSE  or  x101=FALSE  ) &
   (  x61=FALSE  or  x102=FALSE  ) &
   (  x63=FALSE  or  x103=FALSE  ) &
   (  x65=FALSE  or  x104=FALSE  ) &
   (  x58=FALSE  or  x94=FALSE  ) &
   (  x58=FALSE  or  x95=FALSE  ) &
   (  x58=FALSE  or  x96=FALSE  ) &
   (  x58=FALSE  or  x97=FALSE  ) &
   (  x69=FALSE  or  x99=FALSE  or  x27=TRUE  ) &
   (  x69=FALSE  or  x95=FALSE  or  x28=TRUE  ) &
   (  x69=FALSE  or  x96=FALSE  or  x29=TRUE  ) &
   (  x69=FALSE  or  x97=FALSE  or  x30=TRUE  ) &
   (  x69=FALSE  or  x98=FALSE  or  x31=TRUE  ) &
   (  x76=FALSE  or  x99=FALSE  ) &
   (  x76=FALSE  or  x94=FALSE  or  x33=TRUE  ) &
   (  x76=FALSE  or  x96=FALSE  or  x34=TRUE  ) &
   (  x76=FALSE  or  x97=FALSE  or  x35=TRUE  ) &
   (  x76=FALSE  or  x98=FALSE  or  x36=TRUE  ) &
   (  x82=FALSE  or  x99=FALSE  ) &
   (  x82=FALSE  or  x94=FALSE  or  x38=TRUE  ) &
   (  x82=FALSE  or  x95=FALSE  or  x39=TRUE  ) &
   (  x82=FALSE  or  x97=FALSE  or  x40=TRUE  ) &
   (  x82=FALSE  or  x98=FALSE  or  x41=TRUE  ) &
   (  x88=FALSE  or  x99=FALSE  ) &
   (  x88=FALSE  or  x94=FALSE  or  x43=TRUE  ) &
   (  x88=FALSE  or  x95=FALSE  or  x44=TRUE  ) &
   (  x88=FALSE  or  x96=FALSE  or  x45=TRUE  ) &
   (  x88=FALSE  or  x98=FALSE  or  x46=TRUE  ) &
   (  x58=FALSE  or  x53=TRUE  ) &
   (  x69=FALSE  or  x54=TRUE  ) &
   (  x76=FALSE  or  x55=TRUE  ) &
   (  x82=FALSE  or  x56=TRUE  ) &
   (  x88=FALSE  or  x57=TRUE  ) &
   (  x70=FALSE  or  x53=TRUE  ) &
   (  x59=FALSE  or  x54=TRUE  ) &
   (  x61=FALSE  or  x55=TRUE  ) &
   (  x63=FALSE  or  x56=TRUE  ) &
   (  x65=FALSE  or  x57=TRUE  ) &
   (  x70=TRUE  or  x53=FALSE  or  x100=TRUE  ) &
   (  x59=TRUE  or  x54=FALSE  or  x101=TRUE  ) &
   (  x61=TRUE  or  x55=FALSE  or  x102=TRUE  ) &
   (  x63=TRUE  or  x56=FALSE  or  x103=TRUE  ) &
   (  x65=TRUE  or  x57=FALSE  or  x104=TRUE  ) &
   (  x58=TRUE  or  x68=TRUE  ) &
   (  x69=TRUE  or  x27=FALSE  or  x71=TRUE  ) &
   (  x69=TRUE  or  x28=FALSE  or  x72=TRUE  ) &
   (  x69=TRUE  or  x29=FALSE  or  x73=TRUE  ) &
   (  x69=TRUE  or  x30=FALSE  or  x74=TRUE  ) &
   (  x69=TRUE  or  x31=FALSE  or  x75=TRUE  ) &
   (  x76=TRUE  or  x33=FALSE  or  x78=TRUE  ) &
   (  x76=TRUE  or  x34=FALSE  or  x79=TRUE  ) &
   (  x76=TRUE  or  x35=FALSE  or  x80=TRUE  ) &
   (  x76=TRUE  or  x36=FALSE  or  x81=TRUE  ) &
   (  x82=TRUE  or  x38=FALSE  or  x84=TRUE  ) &
   (  x82=TRUE  or  x39=FALSE  or  x85=TRUE  ) &
   (  x82=TRUE  or  x40=FALSE  or  x86=TRUE  ) &
   (  x82=TRUE  or  x41=FALSE  or  x87=TRUE  ) &
   (  x88=TRUE  or  x43=FALSE  or  x90=TRUE  ) &
   (  x88=TRUE  or  x44=FALSE  or  x91=TRUE  ) &
   (  x88=TRUE  or  x45=FALSE  or  x92=TRUE  ) &
   (  x88=TRUE  or  x46=FALSE  or  x93=TRUE  ) &
   (  x99=TRUE  or  x53=TRUE  or  x100=FALSE  ) &
   (  x94=TRUE  or  x54=TRUE  or  x101=FALSE  ) &
   (  x95=TRUE  or  x55=TRUE  or  x102=FALSE  ) &
   (  x96=TRUE  or  x56=TRUE  or  x103=FALSE  ) &
   (  x97=TRUE  or  x57=TRUE  or  x104=FALSE  ) &
   (  x58=TRUE  or  x60=FALSE  ) &
   (  x58=TRUE  or  x62=FALSE  ) &
   (  x58=TRUE  or  x64=FALSE  ) &
   (  x58=TRUE  or  x66=FALSE  ) &
   (  x69=TRUE  or  x27=TRUE  or  x71=FALSE  ) &
   (  x69=TRUE  or  x28=TRUE  or  x72=FALSE  ) &
   (  x69=TRUE  or  x29=TRUE  or  x73=FALSE  ) &
   (  x69=TRUE  or  x30=TRUE  or  x74=FALSE  ) &
   (  x69=TRUE  or  x31=TRUE  or  x75=FALSE  ) &
   (  x76=TRUE  or  x77=FALSE  ) &
   (  x76=TRUE  or  x33=TRUE  or  x78=FALSE  ) &
   (  x76=TRUE  or  x34=TRUE  or  x79=FALSE  ) &
   (  x76=TRUE  or  x35=TRUE  or  x80=FALSE  ) &
   (  x76=TRUE  or  x36=TRUE  or  x81=FALSE  ) &
   (  x82=TRUE  or  x83=FALSE  ) &
   (  x82=TRUE  or  x38=TRUE  or  x84=FALSE  ) &
   (  x82=TRUE  or  x39=TRUE  or  x85=FALSE  ) &
   (  x82=TRUE  or  x40=TRUE  or  x86=FALSE  ) &
   (  x82=TRUE  or  x41=TRUE  or  x87=FALSE  ) &
   (  x88=TRUE  or  x89=FALSE  ) &
   (  x88=TRUE  or  x43=TRUE  or  x90=FALSE  ) &
   (  x88=TRUE  or  x44=TRUE  or  x91=FALSE  ) &
   (  x88=TRUE  or  x45=TRUE  or  x92=FALSE  ) &
   (  x88=TRUE  or  x46=TRUE  or  x93=FALSE  ) &
   (  x59=TRUE  or  x60=FALSE  ) &
   (  x61=TRUE  or  x62=FALSE  ) &
   (  x63=TRUE  or  x64=FALSE  ) &
   (  x65=TRUE  or  x66=FALSE  ) &
   (  x70=TRUE  or  x27=TRUE  or  x71=FALSE  ) &
   (  x61=TRUE  or  x28=TRUE  or  x72=FALSE  ) &
   (  x63=TRUE  or  x29=TRUE  or  x73=FALSE  ) &
   (  x65=TRUE  or  x30=TRUE  or  x74=FALSE  ) &
   (  x67=TRUE  or  x31=TRUE  or  x75=FALSE  ) &
   (  x70=TRUE  or  x77=FALSE  ) &
   (  x59=TRUE  or  x33=TRUE  or  x78=FALSE  ) &
   (  x63=TRUE  or  x34=TRUE  or  x79=FALSE  ) &
   (  x65=TRUE  or  x35=TRUE  or  x80=FALSE  ) &
   (  x67=TRUE  or  x36=TRUE  or  x81=FALSE  ) &
   (  x70=TRUE  or  x83=FALSE  ) &
   (  x59=TRUE  or  x38=TRUE  or  x84=FALSE  ) &
   (  x61=TRUE  or  x39=TRUE  or  x85=FALSE  ) &
   (  x65=TRUE  or  x40=TRUE  or  x86=FALSE  ) &
   (  x67=TRUE  or  x41=TRUE  or  x87=FALSE  ) &
   (  x70=TRUE  or  x89=FALSE  ) &
   (  x59=TRUE  or  x43=TRUE  or  x90=FALSE  ) &
   (  x61=TRUE  or  x44=TRUE  or  x91=FALSE  ) &
   (  x63=TRUE  or  x45=TRUE  or  x92=FALSE  ) &
   (  x67=TRUE  or  x46=TRUE  or  x93=FALSE  ) &
   (  x58=TRUE  or  x69=TRUE  or  x76=TRUE  or  x82=TRUE  or  x88=TRUE  ) &
   (  x99=TRUE  or  x94=TRUE  or  x95=TRUE  or  x96=TRUE  or  x97=TRUE  or  x98=TRUE  ) &
   (  x70=TRUE  or  x59=TRUE  or  x61=TRUE  or  x63=TRUE  or  x65=TRUE  or  x67=TRUE  ) &
   (  x58=FALSE  or  x69=FALSE  ) &
   (  x58=FALSE  or  x76=FALSE  ) &
   (  x58=FALSE  or  x82=FALSE  ) &
   (  x58=FALSE  or  x88=FALSE  ) &
   (  x69=FALSE  or  x58=FALSE  ) &
   (  x69=FALSE  or  x76=FALSE  ) &
   (  x69=FALSE  or  x82=FALSE  ) &
   (  x69=FALSE  or  x88=FALSE  ) &
   (  x76=FALSE  or  x58=FALSE  ) &
   (  x76=FALSE  or  x69=FALSE  ) &
   (  x76=FALSE  or  x82=FALSE  ) &
   (  x76=FALSE  or  x88=FALSE  ) &
   (  x82=FALSE  or  x58=FALSE  ) &
   (  x82=FALSE  or  x69=FALSE  ) &
   (  x82=FALSE  or  x76=FALSE  ) &
   (  x82=FALSE  or  x88=FALSE  ) &
   (  x88=FALSE  or  x58=FALSE  ) &
   (  x88=FALSE  or  x69=FALSE  ) &
   (  x88=FALSE  or  x76=FALSE  ) &
   (  x88=FALSE  or  x82=FALSE  ) &
   (  x99=FALSE  or  x94=FALSE  ) &
   (  x99=FALSE  or  x95=FALSE  ) &
   (  x99=FALSE  or  x96=FALSE  ) &
   (  x99=FALSE  or  x97=FALSE  ) &
   (  x99=FALSE  or  x98=FALSE  ) &
   (  x94=FALSE  or  x99=FALSE  ) &
   (  x94=FALSE  or  x95=FALSE  ) &
   (  x94=FALSE  or  x96=FALSE  ) &
   (  x94=FALSE  or  x97=FALSE  ) &
   (  x94=FALSE  or  x98=FALSE  ) &
   (  x95=FALSE  or  x99=FALSE  ) &
   (  x95=FALSE  or  x94=FALSE  ) &
   (  x95=FALSE  or  x96=FALSE  ) &
   (  x95=FALSE  or  x97=FALSE  ) &
   (  x95=FALSE  or  x98=FALSE  ) &
   (  x96=FALSE  or  x99=FALSE  ) &
   (  x96=FALSE  or  x94=FALSE  ) &
   (  x96=FALSE  or  x95=FALSE  ) &
   (  x96=FALSE  or  x97=FALSE  ) &
   (  x96=FALSE  or  x98=FALSE  ) &
   (  x97=FALSE  or  x99=FALSE  ) &
   (  x97=FALSE  or  x94=FALSE  ) &
   (  x97=FALSE  or  x95=FALSE  ) &
   (  x97=FALSE  or  x96=FALSE  ) &
   (  x97=FALSE  or  x98=FALSE  ) &
   (  x98=FALSE  or  x99=FALSE  ) &
   (  x98=FALSE  or  x94=FALSE  ) &
   (  x98=FALSE  or  x95=FALSE  ) &
   (  x98=FALSE  or  x96=FALSE  ) &
   (  x98=FALSE  or  x97=FALSE  ) &
   (  x70=FALSE  or  x59=FALSE  ) &
   (  x70=FALSE  or  x61=FALSE  ) &
   (  x70=FALSE  or  x63=FALSE  ) &
   (  x70=FALSE  or  x65=FALSE  ) &
   (  x70=FALSE  or  x67=FALSE  ) &
   (  x59=FALSE  or  x70=FALSE  ) &
   (  x59=FALSE  or  x61=FALSE  ) &
   (  x59=FALSE  or  x63=FALSE  ) &
   (  x59=FALSE  or  x65=FALSE  ) &
   (  x59=FALSE  or  x67=FALSE  ) &
   (  x61=FALSE  or  x70=FALSE  ) &
   (  x61=FALSE  or  x59=FALSE  ) &
   (  x61=FALSE  or  x63=FALSE  ) &
   (  x61=FALSE  or  x65=FALSE  ) &
   (  x61=FALSE  or  x67=FALSE  ) &
   (  x63=FALSE  or  x70=FALSE  ) &
   (  x63=FALSE  or  x59=FALSE  ) &
   (  x63=FALSE  or  x61=FALSE  ) &
   (  x63=FALSE  or  x65=FALSE  ) &
   (  x63=FALSE  or  x67=FALSE  ) &
   (  x65=FALSE  or  x70=FALSE  ) &
   (  x65=FALSE  or  x59=FALSE  ) &
   (  x65=FALSE  or  x61=FALSE  ) &
   (  x65=FALSE  or  x63=FALSE  ) &
   (  x65=FALSE  or  x67=FALSE  ) &
   (  x67=FALSE  or  x70=FALSE  ) &
   (  x67=FALSE  or  x59=FALSE  ) &
   (  x67=FALSE  or  x61=FALSE  ) &
   (  x67=FALSE  or  x63=FALSE  ) &
   (  x67=FALSE  or  x65=FALSE  ) &
   (  x58=FALSE  or  x99=FALSE  ) &
   (  x69=FALSE  or  x94=FALSE  ) &
   (  x76=FALSE  or  x95=FALSE  ) &
   (  x82=FALSE  or  x96=FALSE  ) &
   (  x88=FALSE  or  x97=FALSE  ) &
   (  x58=FALSE  or  x70=FALSE  ) &
   (  x69=FALSE  or  x59=FALSE  ) &
   (  x76=FALSE  or  x61=FALSE  ) &
   (  x82=FALSE  or  x63=FALSE  ) &
   (  x88=FALSE  or  x65=FALSE  ) &
   (  x99=FALSE  or  x70=FALSE  ) &
   (  x94=FALSE  or  x59=FALSE  ) &
   (  x95=FALSE  or  x61=FALSE  ) &
   (  x96=FALSE  or  x63=FALSE  ) &
   (  x97=FALSE  or  x65=FALSE  ) &
   (  x98=FALSE  or  x67=FALSE  ) &
   (  x105=FALSE  or  x106=FALSE  ) &
   (  x105=FALSE  or  x107=FALSE  ) &
   (  x109=FALSE  or  x107=FALSE  ) &
   (  x110=FALSE  or  x106=FALSE  ) &
   (  x111=FALSE  or  x107=FALSE  ) &
   (  x111=FALSE  or  x108=FALSE  ) &
   (  x112=FALSE  or  x106=FALSE  ) &
   (  x112=FALSE  or  x108=FALSE  ) &
   (  x105=FALSE  or  x115=FALSE  ) &
   (  x109=FALSE  or  x115=FALSE  ) &
   (  x110=FALSE  or  x115=FALSE  ) &
   (  x105=FALSE  or  x113=FALSE  or  x64=TRUE  ) &
   (  x105=FALSE  or  x114=FALSE  or  x66=TRUE  ) &
   (  x109=FALSE  or  x116=FALSE  or  x71=TRUE  ) &
   (  x109=FALSE  or  x113=FALSE  or  x73=TRUE  ) &
   (  x109=FALSE  or  x114=FALSE  or  x74=TRUE  ) &
   (  x110=FALSE  or  x116=FALSE  or  x77=TRUE  ) &
   (  x110=FALSE  or  x113=FALSE  or  x79=TRUE  ) &
   (  x110=FALSE  or  x114=FALSE  or  x80=TRUE  ) &
   (  x111=FALSE  or  x116=FALSE  or  x83=TRUE  ) &
   (  x111=FALSE  or  x114=FALSE  or  x86=TRUE  ) &
   (  x111=FALSE  or  x115=FALSE  or  x87=TRUE  ) &
   (  x112=FALSE  or  x116=FALSE  or  x89=TRUE  ) &
   (  x112=FALSE  or  x113=FALSE  or  x92=TRUE  ) &
   (  x112=FALSE  or  x115=FALSE  or  x93=TRUE  ) &
   (  x105=FALSE  or  x100=TRUE  ) &
   (  x109=FALSE  or  x101=TRUE  ) &
   (  x110=FALSE  or  x102=TRUE  ) &
   (  x111=FALSE  or  x103=TRUE  ) &
   (  x112=FALSE  or  x104=TRUE  ) &
   (  x106=FALSE  or  x101=TRUE  ) &
   (  x107=FALSE  or  x102=TRUE  ) &
   (  x106=TRUE  or  x101=FALSE  ) &
   (  x107=TRUE  or  x102=FALSE  ) &
   (  x105=TRUE  or  x60=FALSE  ) &
   (  x105=TRUE  or  x62=FALSE  ) &
   (  x105=TRUE  or  x64=FALSE  ) &
   (  x105=TRUE  or  x66=FALSE  ) &
   (  x109=TRUE  or  x71=FALSE  ) &
   (  x109=TRUE  or  x72=FALSE  ) &
   (  x109=TRUE  or  x73=FALSE  ) &
   (  x109=TRUE  or  x74=FALSE  ) &
   (  x110=TRUE  or  x77=FALSE  ) &
   (  x110=TRUE  or  x78=FALSE  ) &
   (  x110=TRUE  or  x79=FALSE  ) &
   (  x110=TRUE  or  x80=FALSE  ) &
   (  x111=TRUE  or  x83=FALSE  ) &
   (  x111=TRUE  or  x85=FALSE  ) &
   (  x111=TRUE  or  x86=FALSE  ) &
   (  x111=TRUE  or  x87=FALSE  ) &
   (  x112=TRUE  or  x89=FALSE  ) &
   (  x112=TRUE  or  x90=FALSE  ) &
   (  x112=TRUE  or  x92=FALSE  ) &
   (  x112=TRUE  or  x93=FALSE  ) &
   (  x116=TRUE  or  x100=TRUE  ) &
   (  x113=TRUE  or  x103=TRUE  ) &
   (  x114=TRUE  or  x104=TRUE  ) &
   (  x105=TRUE  or  x68=TRUE  ) &
   (  x109=TRUE  or  x75=TRUE  ) &
   (  x110=TRUE  or  x81=TRUE  ) &
   (  x111=TRUE  or  x84=TRUE  ) &
   (  x112=TRUE  or  x91=TRUE  ) &
   (  x108=TRUE  or  x68=TRUE  ) &
   (  x108=TRUE  or  x75=TRUE  ) &
   (  x108=TRUE  or  x81=TRUE  ) &
   (  x106=TRUE  or  x84=TRUE  ) &
   (  x107=TRUE  or  x91=TRUE  ) &
   (  x105=TRUE  or  x109=TRUE  or  x110=TRUE  or  x111=TRUE  or  x112=TRUE  ) &
   (  x116=TRUE  or  x113=TRUE  or  x114=TRUE  or  x115=TRUE  ) &
   (  x106=TRUE  or  x107=TRUE  or  x108=TRUE  ) &
   (  x105=FALSE  or  x109=FALSE  ) &
   (  x105=FALSE  or  x110=FALSE  ) &
   (  x105=FALSE  or  x111=FALSE  ) &
   (  x105=FALSE  or  x112=FALSE  ) &
   (  x109=FALSE  or  x105=FALSE  ) &
   (  x109=FALSE  or  x110=FALSE  ) &
   (  x109=FALSE  or  x111=FALSE  ) &
   (  x109=FALSE  or  x112=FALSE  ) &
   (  x110=FALSE  or  x105=FALSE  ) &
   (  x110=FALSE  or  x109=FALSE  ) &
   (  x110=FALSE  or  x111=FALSE  ) &
   (  x110=FALSE  or  x112=FALSE  ) &
   (  x111=FALSE  or  x105=FALSE  ) &
   (  x111=FALSE  or  x109=FALSE  ) &
   (  x111=FALSE  or  x110=FALSE  ) &
   (  x111=FALSE  or  x112=FALSE  ) &
   (  x112=FALSE  or  x105=FALSE  ) &
   (  x112=FALSE  or  x109=FALSE  ) &
   (  x112=FALSE  or  x110=FALSE  ) &
   (  x112=FALSE  or  x111=FALSE  ) &
   (  x116=FALSE  or  x113=FALSE  ) &
   (  x116=FALSE  or  x114=FALSE  ) &
   (  x116=FALSE  or  x115=FALSE  ) &
   (  x113=FALSE  or  x116=FALSE  ) &
   (  x113=FALSE  or  x114=FALSE  ) &
   (  x113=FALSE  or  x115=FALSE  ) &
   (  x114=FALSE  or  x116=FALSE  ) &
   (  x114=FALSE  or  x113=FALSE  ) &
   (  x114=FALSE  or  x115=FALSE  ) &
   (  x115=FALSE  or  x116=FALSE  ) &
   (  x115=FALSE  or  x113=FALSE  ) &
   (  x115=FALSE  or  x114=FALSE  ) &
   (  x106=FALSE  or  x107=FALSE  ) &
   (  x106=FALSE  or  x108=FALSE  ) &
   (  x107=FALSE  or  x106=FALSE  ) &
   (  x107=FALSE  or  x108=FALSE  ) &
   (  x108=FALSE  or  x106=FALSE  ) &
   (  x108=FALSE  or  x107=FALSE  ) &
   (  x105=FALSE  or  x116=FALSE  ) &
   (  x111=FALSE  or  x113=FALSE  ) &
   (  x112=FALSE  or  x114=FALSE  ) &
   (  x109=FALSE  or  x106=FALSE  ) &
   (  x110=FALSE  or  x107=FALSE  ) &
   (  x115=FALSE  or  x108=FALSE  ) &
   (  x6=FALSE  or  x9=FALSE  ) &
   (  x9=FALSE  or  x6=FALSE  ) &
   (  x5=FALSE  or  x6=FALSE  ) &
   (  x5=FALSE  or  x7=FALSE  ) &
   (  x6=FALSE  or  x5=FALSE  ) &
   (  x6=FALSE  or  x7=FALSE  ) &
   (  x7=FALSE  or  x5=FALSE  ) &
   (  x7=FALSE  or  x6=FALSE  ) &
   (  x9=FALSE  or  x10=FALSE  ) &
   (  x9=FALSE  or  x11=FALSE  ) &
   (  x10=FALSE  or  x9=FALSE  ) &
   (  x10=FALSE  or  x11=FALSE  ) &
   (  x11=FALSE  or  x9=FALSE  ) &
   (  x11=FALSE  or  x10=FALSE  ) &
   (  x5=FALSE  or  x17=FALSE  ) &
   (  x6=FALSE  or  x20=FALSE  ) &
   (  x9=FALSE  or  x18=FALSE  ) &
   (  x10=FALSE  or  x19=FALSE  ) &
   (  x28=FALSE  or  x33=FALSE  ) &
   (  x29=FALSE  or  x38=FALSE  ) &
   (  x30=FALSE  or  x43=FALSE  ) &
   (  x33=FALSE  or  x28=FALSE  ) &
   (  x34=FALSE  or  x39=FALSE  ) &
   (  x35=FALSE  or  x44=FALSE  ) &
   (  x38=FALSE  or  x29=FALSE  ) &
   (  x39=FALSE  or  x34=FALSE  ) &
   (  x40=FALSE  or  x45=FALSE  ) &
   (  x43=FALSE  or  x30=FALSE  ) &
   (  x44=FALSE  or  x35=FALSE  ) &
   (  x45=FALSE  or  x40=FALSE  ) &
   (  x28=FALSE  or  x39=FALSE  ) &
   (  x28=FALSE  or  x44=FALSE  ) &
   (  x29=FALSE  or  x34=FALSE  ) &
   (  x29=FALSE  or  x45=FALSE  ) &
   (  x30=FALSE  or  x35=FALSE  ) &
   (  x30=FALSE  or  x40=FALSE  ) &
   (  x33=FALSE  or  x38=FALSE  ) &
   (  x33=FALSE  or  x43=FALSE  ) &
   (  x34=FALSE  or  x29=FALSE  ) &
   (  x34=FALSE  or  x45=FALSE  ) &
   (  x35=FALSE  or  x30=FALSE  ) &
   (  x35=FALSE  or  x40=FALSE  ) &
   (  x38=FALSE  or  x33=FALSE  ) &
   (  x38=FALSE  or  x43=FALSE  ) &
   (  x39=FALSE  or  x28=FALSE  ) &
   (  x39=FALSE  or  x44=FALSE  ) &
   (  x40=FALSE  or  x30=FALSE  ) &
   (  x40=FALSE  or  x35=FALSE  ) &
   (  x43=FALSE  or  x33=FALSE  ) &
   (  x43=FALSE  or  x38=FALSE  ) &
   (  x44=FALSE  or  x28=FALSE  ) &
   (  x44=FALSE  or  x39=FALSE  ) &
   (  x45=FALSE  or  x29=FALSE  ) &
   (  x45=FALSE  or  x34=FALSE  ) &
   (  x27=FALSE  or  x28=FALSE  ) &
   (  x27=FALSE  or  x29=FALSE  ) &
   (  x27=FALSE  or  x30=FALSE  ) &
   (  x27=FALSE  or  x31=FALSE  ) &
   (  x28=FALSE  or  x27=FALSE  ) &
   (  x28=FALSE  or  x29=FALSE  ) &
   (  x28=FALSE  or  x30=FALSE  ) &
   (  x28=FALSE  or  x31=FALSE  ) &
   (  x29=FALSE  or  x27=FALSE  ) &
   (  x29=FALSE  or  x28=FALSE  ) &
   (  x29=FALSE  or  x30=FALSE  ) &
   (  x29=FALSE  or  x31=FALSE  ) &
   (  x30=FALSE  or  x27=FALSE  ) &
   (  x30=FALSE  or  x28=FALSE  ) &
   (  x30=FALSE  or  x29=FALSE  ) &
   (  x30=FALSE  or  x31=FALSE  ) &
   (  x31=FALSE  or  x27=FALSE  ) &
   (  x31=FALSE  or  x28=FALSE  ) &
   (  x31=FALSE  or  x29=FALSE  ) &
   (  x31=FALSE  or  x30=FALSE  ) &
   (  x33=FALSE  or  x34=FALSE  ) &
   (  x33=FALSE  or  x35=FALSE  ) &
   (  x33=FALSE  or  x36=FALSE  ) &
   (  x34=FALSE  or  x33=FALSE  ) &
   (  x34=FALSE  or  x35=FALSE  ) &
   (  x34=FALSE  or  x36=FALSE  ) &
   (  x35=FALSE  or  x33=FALSE  ) &
   (  x35=FALSE  or  x34=FALSE  ) &
   (  x35=FALSE  or  x36=FALSE  ) &
   (  x36=FALSE  or  x33=FALSE  ) &
   (  x36=FALSE  or  x34=FALSE  ) &
   (  x36=FALSE  or  x35=FALSE  ) &
   (  x38=FALSE  or  x39=FALSE  ) &
   (  x38=FALSE  or  x40=FALSE  ) &
   (  x38=FALSE  or  x41=FALSE  ) &
   (  x39=FALSE  or  x38=FALSE  ) &
   (  x39=FALSE  or  x40=FALSE  ) &
   (  x39=FALSE  or  x41=FALSE  ) &
   (  x40=FALSE  or  x38=FALSE  ) &
   (  x40=FALSE  or  x39=FALSE  ) &
   (  x40=FALSE  or  x41=FALSE  ) &
   (  x41=FALSE  or  x38=FALSE  ) &
   (  x41=FALSE  or  x39=FALSE  ) &
   (  x41=FALSE  or  x40=FALSE  ) &
   (  x43=FALSE  or  x44=FALSE  ) &
   (  x43=FALSE  or  x45=FALSE  ) &
   (  x43=FALSE  or  x46=FALSE  ) &
   (  x44=FALSE  or  x43=FALSE  ) &
   (  x44=FALSE  or  x45=FALSE  ) &
   (  x44=FALSE  or  x46=FALSE  ) &
   (  x45=FALSE  or  x43=FALSE  ) &
   (  x45=FALSE  or  x44=FALSE  ) &
   (  x45=FALSE  or  x46=FALSE  ) &
   (  x46=FALSE  or  x43=FALSE  ) &
   (  x46=FALSE  or  x44=FALSE  ) &
   (  x46=FALSE  or  x45=FALSE  ) &
   (  x27=FALSE  or  x53=FALSE  ) &
   (  x28=FALSE  or  x55=FALSE  ) &
   (  x29=FALSE  or  x56=FALSE  ) &
   (  x30=FALSE  or  x57=FALSE  ) &
   (  x33=FALSE  or  x54=FALSE  ) &
   (  x34=FALSE  or  x56=FALSE  ) &
   (  x35=FALSE  or  x57=FALSE  ) &
   (  x38=FALSE  or  x54=FALSE  ) &
   (  x39=FALSE  or  x55=FALSE  ) &
   (  x40=FALSE  or  x57=FALSE  ) &
   (  x43=FALSE  or  x54=FALSE  ) &
   (  x44=FALSE  or  x55=FALSE  ) &
   (  x45=FALSE  or  x56=FALSE  ) &
   (  x60=FALSE  or  x71=FALSE  ) &
   (  x62=FALSE  or  x77=FALSE  ) &
   (  x64=FALSE  or  x83=FALSE  ) &
   (  x66=FALSE  or  x89=FALSE  ) &
   (  x71=FALSE  or  x60=FALSE  ) &
   (  x72=FALSE  or  x78=FALSE  ) &
   (  x73=FALSE  or  x84=FALSE  ) &
   (  x74=FALSE  or  x90=FALSE  ) &
   (  x77=FALSE  or  x62=FALSE  ) &
   (  x78=FALSE  or  x72=FALSE  ) &
   (  x79=FALSE  or  x85=FALSE  ) &
   (  x80=FALSE  or  x91=FALSE  ) &
   (  x83=FALSE  or  x64=FALSE  ) &
   (  x84=FALSE  or  x73=FALSE  ) &
   (  x85=FALSE  or  x79=FALSE  ) &
   (  x86=FALSE  or  x92=FALSE  ) &
   (  x89=FALSE  or  x66=FALSE  ) &
   (  x90=FALSE  or  x74=FALSE  ) &
   (  x91=FALSE  or  x80=FALSE  ) &
   (  x92=FALSE  or  x86=FALSE  ) &
   (  x60=FALSE  or  x78=FALSE  ) &
   (  x60=FALSE  or  x84=FALSE  ) &
   (  x60=FALSE  or  x90=FALSE  ) &
   (  x62=FALSE  or  x72=FALSE  ) &
   (  x62=FALSE  or  x85=FALSE  ) &
   (  x62=FALSE  or  x91=FALSE  ) &
   (  x64=FALSE  or  x73=FALSE  ) &
   (  x64=FALSE  or  x79=FALSE  ) &
   (  x64=FALSE  or  x92=FALSE  ) &
   (  x66=FALSE  or  x74=FALSE  ) &
   (  x66=FALSE  or  x80=FALSE  ) &
   (  x66=FALSE  or  x86=FALSE  ) &
   (  x71=FALSE  or  x77=FALSE  ) &
   (  x71=FALSE  or  x83=FALSE  ) &
   (  x71=FALSE  or  x89=FALSE  ) &
   (  x72=FALSE  or  x62=FALSE  ) &
   (  x72=FALSE  or  x85=FALSE  ) &
   (  x72=FALSE  or  x91=FALSE  ) &
   (  x73=FALSE  or  x64=FALSE  ) &
   (  x73=FALSE  or  x79=FALSE  ) &
   (  x73=FALSE  or  x92=FALSE  ) &
   (  x74=FALSE  or  x66=FALSE  ) &
   (  x74=FALSE  or  x80=FALSE  ) &
   (  x74=FALSE  or  x86=FALSE  ) &
   (  x77=FALSE  or  x71=FALSE  ) &
   (  x77=FALSE  or  x83=FALSE  ) &
   (  x77=FALSE  or  x89=FALSE  ) &
   (  x78=FALSE  or  x60=FALSE  ) &
   (  x78=FALSE  or  x84=FALSE  ) &
   (  x78=FALSE  or  x90=FALSE  ) &
   (  x79=FALSE  or  x64=FALSE  ) &
   (  x79=FALSE  or  x73=FALSE  ) &
   (  x79=FALSE  or  x92=FALSE  ) &
   (  x80=FALSE  or  x66=FALSE  ) &
   (  x80=FALSE  or  x74=FALSE  ) &
   (  x80=FALSE  or  x86=FALSE  ) &
   (  x83=FALSE  or  x71=FALSE  ) &
   (  x83=FALSE  or  x77=FALSE  ) &
   (  x83=FALSE  or  x89=FALSE  ) &
   (  x84=FALSE  or  x60=FALSE  ) &
   (  x84=FALSE  or  x78=FALSE  ) &
   (  x84=FALSE  or  x90=FALSE  ) &
   (  x85=FALSE  or  x62=FALSE  ) &
   (  x85=FALSE  or  x72=FALSE  ) &
   (  x85=FALSE  or  x91=FALSE  ) &
   (  x86=FALSE  or  x66=FALSE  ) &
   (  x86=FALSE  or  x74=FALSE  ) &
   (  x86=FALSE  or  x80=FALSE  ) &
   (  x89=FALSE  or  x71=FALSE  ) &
   (  x89=FALSE  or  x77=FALSE  ) &
   (  x89=FALSE  or  x83=FALSE  ) &
   (  x90=FALSE  or  x60=FALSE  ) &
   (  x90=FALSE  or  x78=FALSE  ) &
   (  x90=FALSE  or  x84=FALSE  ) &
   (  x91=FALSE  or  x62=FALSE  ) &
   (  x91=FALSE  or  x72=FALSE  ) &
   (  x91=FALSE  or  x85=FALSE  ) &
   (  x92=FALSE  or  x64=FALSE  ) &
   (  x92=FALSE  or  x73=FALSE  ) &
   (  x92=FALSE  or  x79=FALSE  ) &
   (  x60=FALSE  or  x62=FALSE  ) &
   (  x60=FALSE  or  x64=FALSE  ) &
   (  x60=FALSE  or  x66=FALSE  ) &
   (  x60=FALSE  or  x68=FALSE  ) &
   (  x62=FALSE  or  x60=FALSE  ) &
   (  x62=FALSE  or  x64=FALSE  ) &
   (  x62=FALSE  or  x66=FALSE  ) &
   (  x62=FALSE  or  x68=FALSE  ) &
   (  x64=FALSE  or  x60=FALSE  ) &
   (  x64=FALSE  or  x62=FALSE  ) &
   (  x64=FALSE  or  x66=FALSE  ) &
   (  x64=FALSE  or  x68=FALSE  ) &
   (  x66=FALSE  or  x60=FALSE  ) &
   (  x66=FALSE  or  x62=FALSE  ) &
   (  x66=FALSE  or  x64=FALSE  ) &
   (  x66=FALSE  or  x68=FALSE  ) &
   (  x68=FALSE  or  x60=FALSE  ) &
   (  x68=FALSE  or  x62=FALSE  ) &
   (  x68=FALSE  or  x64=FALSE  ) &
   (  x68=FALSE  or  x66=FALSE  ) &
   (  x71=FALSE  or  x72=FALSE  ) &
   (  x71=FALSE  or  x73=FALSE  ) &
   (  x71=FALSE  or  x74=FALSE  ) &
   (  x71=FALSE  or  x75=FALSE  ) &
   (  x72=FALSE  or  x71=FALSE  ) &
   (  x72=FALSE  or  x73=FALSE  ) &
   (  x72=FALSE  or  x74=FALSE  ) &
   (  x72=FALSE  or  x75=FALSE  ) &
   (  x73=FALSE  or  x71=FALSE  ) &
   (  x73=FALSE  or  x72=FALSE  ) &
   (  x73=FALSE  or  x74=FALSE  ) &
   (  x73=FALSE  or  x75=FALSE  ) &
   (  x74=FALSE  or  x71=FALSE  ) &
   (  x74=FALSE  or  x72=FALSE  ) &
   (  x74=FALSE  or  x73=FALSE  ) &
   (  x74=FALSE  or  x75=FALSE  ) &
   (  x75=FALSE  or  x71=FALSE  ) &
   (  x75=FALSE  or  x72=FALSE  ) &
   (  x75=FALSE  or  x73=FALSE  ) &
   (  x75=FALSE  or  x74=FALSE  ) &
   (  x77=FALSE  or  x78=FALSE  ) &
   (  x77=FALSE  or  x79=FALSE  ) &
   (  x77=FALSE  or  x80=FALSE  ) &
   (  x77=FALSE  or  x81=FALSE  ) &
   (  x78=FALSE  or  x77=FALSE  ) &
   (  x78=FALSE  or  x79=FALSE  ) &
   (  x78=FALSE  or  x80=FALSE  ) &
   (  x78=FALSE  or  x81=FALSE  ) &
   (  x79=FALSE  or  x77=FALSE  ) &
   (  x79=FALSE  or  x78=FALSE  ) &
   (  x79=FALSE  or  x80=FALSE  ) &
   (  x79=FALSE  or  x81=FALSE  ) &
   (  x80=FALSE  or  x77=FALSE  ) &
   (  x80=FALSE  or  x78=FALSE  ) &
   (  x80=FALSE  or  x79=FALSE  ) &
   (  x80=FALSE  or  x81=FALSE  ) &
   (  x81=FALSE  or  x77=FALSE  ) &
   (  x81=FALSE  or  x78=FALSE  ) &
   (  x81=FALSE  or  x79=FALSE  ) &
   (  x81=FALSE  or  x80=FALSE  ) &
   (  x83=FALSE  or  x84=FALSE  ) &
   (  x83=FALSE  or  x85=FALSE  ) &
   (  x83=FALSE  or  x86=FALSE  ) &
   (  x83=FALSE  or  x87=FALSE  ) &
   (  x84=FALSE  or  x83=FALSE  ) &
   (  x84=FALSE  or  x85=FALSE  ) &
   (  x84=FALSE  or  x86=FALSE  ) &
   (  x84=FALSE  or  x87=FALSE  ) &
   (  x85=FALSE  or  x83=FALSE  ) &
   (  x85=FALSE  or  x84=FALSE  ) &
   (  x85=FALSE  or  x86=FALSE  ) &
   (  x85=FALSE  or  x87=FALSE  ) &
   (  x86=FALSE  or  x83=FALSE  ) &
   (  x86=FALSE  or  x84=FALSE  ) &
   (  x86=FALSE  or  x85=FALSE  ) &
   (  x86=FALSE  or  x87=FALSE  ) &
   (  x87=FALSE  or  x83=FALSE  ) &
   (  x87=FALSE  or  x84=FALSE  ) &
   (  x87=FALSE  or  x85=FALSE  ) &
   (  x87=FALSE  or  x86=FALSE  ) &
   (  x89=FALSE  or  x90=FALSE  ) &
   (  x89=FALSE  or  x91=FALSE  ) &
   (  x89=FALSE  or  x92=FALSE  ) &
   (  x89=FALSE  or  x93=FALSE  ) &
   (  x90=FALSE  or  x89=FALSE  ) &
   (  x90=FALSE  or  x91=FALSE  ) &
   (  x90=FALSE  or  x92=FALSE  ) &
   (  x90=FALSE  or  x93=FALSE  ) &
   (  x91=FALSE  or  x89=FALSE  ) &
   (  x91=FALSE  or  x90=FALSE  ) &
   (  x91=FALSE  or  x92=FALSE  ) &
   (  x91=FALSE  or  x93=FALSE  ) &
   (  x92=FALSE  or  x89=FALSE  ) &
   (  x92=FALSE  or  x90=FALSE  ) &
   (  x92=FALSE  or  x91=FALSE  ) &
   (  x92=FALSE  or  x93=FALSE  ) &
   (  x93=FALSE  or  x89=FALSE  ) &
   (  x93=FALSE  or  x90=FALSE  ) &
   (  x93=FALSE  or  x91=FALSE  ) &
   (  x93=FALSE  or  x92=FALSE  ) &
   (  x60=FALSE  or  x101=FALSE  ) &
   (  x62=FALSE  or  x102=FALSE  ) &
   (  x64=FALSE  or  x103=FALSE  ) &
   (  x66=FALSE  or  x104=FALSE  ) &
   (  x71=FALSE  or  x100=FALSE  ) &
   (  x72=FALSE  or  x102=FALSE  ) &
   (  x73=FALSE  or  x103=FALSE  ) &
   (  x74=FALSE  or  x104=FALSE  ) &
   (  x77=FALSE  or  x100=FALSE  ) &
   (  x78=FALSE  or  x101=FALSE  ) &
   (  x79=FALSE  or  x103=FALSE  ) &
   (  x80=FALSE  or  x104=FALSE  ) &
   (  x83=FALSE  or  x100=FALSE  ) &
   (  x84=FALSE  or  x101=FALSE  ) &
   (  x85=FALSE  or  x102=FALSE  ) &
   (  x86=FALSE  or  x104=FALSE  ) &
   (  x89=FALSE  or  x100=FALSE  ) &
   (  x90=FALSE  or  x101=FALSE  ) &
   (  x91=FALSE  or  x102=FALSE  ) &
   (  x92=FALSE  or  x103=FALSE  ) 
   )
PROPERTIES PROPS
OPERATIONS
 res <-- check_props = IF PROPS THEN res := TRUE ELSE res := FALSE END
END
