begin 
  irec = 33 -1 ; ��Ӧ����վ��160վ��λ�ã�����ɲ鿴station-name.txt

  ntime = 30   ; ��30��ʱ��
  nstat = 160  ; ��160վ
    
  ;��ȡȫ�����ݣ�ע�����ݴ�ŵ�·���������д����./data ��
  preci = fbindirread("./data/preci-160-JJA-30yr.grd",0,(/ntime,nstat/),"float") 
  
  ;�ֶ�����meta data
  preci!0="year" 
  preci!1="station"
  preci&year = ispan(1979,2008,1)
  preci&station = ispan(1,160,1)
  
  ; ��������վ������,�����������쳣������meta data

   
;***************************************************** 
; create plot
;***************************************************** 
  wks = gsn_open_wks("eps","plot-bar-1station")  ;����epsͼ            
 
  res           = True              
  res@gsnDraw   = False ; �ݲ���
  res@gsnFrame  = False ; �ݲ���ҳ

  res@vpHeightF = 0.35  ; �ı�viewport�Ĵ�С
  res@vpWidthF 	= 0.6   ; 

  res@trXMinF	  = 1979  ; �趨X�����귶Χ
  res@trXMaxF	  = 2008
  res@trYMaxF   = 450  ; �趨Y�����귶Χ
  res@trYMinF   = -300 

  
   ;           ; �趨bar�Ŀ���

  ;�趨bar��
  res@gsnYRefLine           = 0.              ; �趨�ο�ֵ��
  res@gsnAboveYRefLineColor = "black"           ; ���ڸòο�ֵ���õ���ɫ
  res@gsnBelowYRefLineColor = "gray"          ; С�ڸòο�ֵ���õ���ɫ

  ;res@gsnXYBarChartColors = (/"black"/)   ;������趨�ο�ֵ,���ͨ����resources���趨	��ɫ 
   
  res@tiXAxisString	= "year"             ; ����X������   
  res@tiYAxisString	= "precipitation (units: mm)"    ; ����Y������ 
  
  top_plot = gsn_csm_xy(wks,preci_st&year,preci_st,res)       ; ��ͼ
    
  draw(top_plot) ; ��ͼ
  frame(wks)     ; ��ҳ
end