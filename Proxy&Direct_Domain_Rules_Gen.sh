#!/bin/bash
echo `date`

File_Path='File_Path'
Source_Path='Source_Path'
PUID=1000
PGID=1000

echo "——————————————————————————————————文件检测开始——————————————————————————————————"
if [ -e "${File_Path}/Proxy-domain.list" ]
then
    echo "代理域名文件存在，变更命名为.bak文件"
    if [ -e "${File_Path}/Proxy-domain.list.bak" ]
    then
        echo "删除旧版代理域名文件备份"
        rm "${File_Path}/Proxy-domain.list.bak"
    fi
    echo "创建代理域名文件"
    mv "${File_Path}/Proxy-domain.list" "${File_Path}/Proxy-domain.list.bak"
    touch "${File_Path}/Proxy-domain.list"
else
    echo "代理域名文件不存在，正在创建"
    touch "${File_Path}/Proxy-domain.list"
fi

if [ -e "${File_Path}/Direct-domain.list" ]
then
    echo "直连域名文件存在，变更命名为.bak文件"
    if [ -e "${File_Path}/Direct-domain.list.bak" ]
    then
        echo "删除旧版直连域名文件备份"
        rm "${File_Path}/Direct-domain.list.bak"
    fi
    echo "创建直连域名文件"
    mv "${File_Path}/Direct-domain.list" "${File_Path}/Direct-domain.list.bak"
    touch "${File_Path}/Direct-domain.list"
else
    echo "直连文件不存在，正在创建"
    touch "${File_Path}/Direct-domain.list"
fi
echo -e "\n"
if [ -e "${File_Path}/Proxy-domain-OPNsense.list" ]
then
    echo "代理域名OPNsense文件存在，变更命名为.bak文件"
    if [ -e "${File_Path}/Proxy-domain-OPNsense.list.bak" ]
    then
        echo "删除旧版代理域名OPNsense文件备份"
        rm "${File_Path}/Proxy-domain-OPNsense.list.bak"
    fi
    echo "创建代理域名OPNsense文件"
    mv "${File_Path}/Proxy-domain-OPNsense.list" "${File_Path}/Proxy-domain-OPNsense.list.bak"
    touch "${File_Path}/Proxy-domain-OPNsense.list"
else
    echo "代理域名OPNsense文件不存在，正在创建"
    touch "${File_Path}/Proxy-domain-OPNsense.list"
fi

if [ -e "${File_Path}/Direct-domain-OPNsense.list" ]
then
    echo "直连域名OPNsense文件存在，变更命名为.bak文件"
    if [ -e "${File_Path}/Direct-domain-OPNsense.list.bak" ]
    then
        echo "删除旧版直连域名OPNsense文件备份"
        rm "${File_Path}/Direct-domain-OPNsense.list.bak"
    fi
    echo "创建直连域名OPNsense文件"
    mv "${File_Path}/Direct-domain-OPNsense.list" "${File_Path}/Direct-domain-OPNsense.list.bak"
    touch "${File_Path}/Direct-domain-OPNsense.list"
else
    echo "直连OPNsense文件不存在，正在创建"
    touch "${File_Path}/Direct-domain-OPNsense.list"
fi
echo -e "\n"
if [ -e "${File_Path}/Proxy-domain-Mosdns.list" ]
then
    echo "代理域名Mosdns文件存在，变更命名为.bak文件"
    if [ -e "${File_Path}/Proxy-domain-Mosdns.list.bak" ]
    then
        echo "删除旧版代理域名Mosdns文件备份"
        rm "${File_Path}/Proxy-domain-Mosdns.list.bak"
    fi
    echo "创建代理域名Mosdns文件"
    mv "${File_Path}/Proxy-domain-Mosdns.list" "${File_Path}/Proxy-domain-Mosdns.list.bak"
    touch "${File_Path}/Proxy-domain-Mosdns.list"
else
    echo "代理域名Mosdns文件不存在，正在创建"
    touch "${File_Path}/Proxy-domain-Mosdns.list"
fi

if [ -e "${File_Path}/Direct-domain-Mosdns.list" ]
then
    echo "直连域名Mosdns文件存在，变更命名为.bak文件"
    if [ -e "${File_Path}/Direct-domain-Mosdns.list.bak" ]
    then
        echo "删除旧版直连域名Mosdns文件备份"
        rm "${File_Path}/Direct-domain-Mosdns.list.bak"
    fi
    echo "创建直连域名Mosdns文件"
    mv "${File_Path}/Direct-domain-Mosdns.list" "${File_Path}/Direct-domain-Mosdns.list.bak"
    touch "${File_Path}/Direct-domain-Mosdns.list"
else
    echo "直连Mosdns文件不存在，正在创建"
    touch "${File_Path}/Direct-domain-Mosdns.list"
fi
echo "——————————————————————————————————文件检测结束——————————————————————————————————"

echo -e "\n"

echo "——————————————————————————————————文件写入开始——————————————————————————————————"
echo "写入代理域名文件"
cat "${Source_Path}/Proxy/"*.list >>         "${File_Path}/Proxy-domain.list"
echo -e '\n' >> "${File_Path}/Proxy-domain.list"
cat "${Source_Path}/Category/"*.list >>      "${File_Path}/Proxy-domain.list"
echo -e '\n' >> "${File_Path}/Proxy-domain.list"
cat "${Source_Path}/Custom/"*-Proxy.list >>  "${File_Path}/Proxy-domain.list"
echo "完成"
echo -e '\n'
echo "写入直连域名文件"
cat "${Source_Path}/Direct/"*.list >>        "${File_Path}/Direct-domain.list"
echo -e '\n' >> "${File_Path}/Direct-domain.list"
cat "${Source_Path}/Custom/"*-Direct.list >> "${File_Path}/Direct-domain.list"
echo "完成"
echo "——————————————————————————————————文件写入结束——————————————————————————————————"

echo -e "\n"

echo "——————————————————————————————————文件内容修改开始——————————————————————————————————"
echo "删除无需内容"
echo "代理文件删除内容"
sed -i '/IP-CIDR6/d'                 "${File_Path}/Proxy-domain.list"
sed -i '/USER-AGENT/d'               "${File_Path}/Proxy-domain.list"
sed -i '/URL-REGEX/d'                "${File_Path}/Proxy-domain.list"
sed -i '/PROCESS-NAME/d'             "${File_Path}/Proxy-domain.list"
echo "完成"
echo "直连文件删除内容"
sed -i '/IP-CIDR6/d'                  "${File_Path}/Direct-domain.list"
sed -i '/USER-AGENT/d'               "${File_Path}/Direct-domain.list"
sed -i '/URL-REGEX/d'                "${File_Path}/Direct-domain.list"
sed -i '/PROCESS-NAME/d'             "${File_Path}/Direct-domain.list"
echo "完成"
echo "复制文件到OPNsense专用和Mosdns专用"
cp "${File_Path}/Proxy-domain.list"  "${File_Path}/Proxy-domain-OPNsense.list"
cp "${File_Path}/Proxy-domain.list"  "${File_Path}/Proxy-domain-Mosdns.list"
cp "${File_Path}/Direct-domain.list" "${File_Path}/Direct-domain-OPNsense.list"
cp "${File_Path}/Direct-domain.list" "${File_Path}/Direct-domain-Mosdns.list"
echo "完成"
echo "OPNsense专用文件删除多余内容"
sed -i '/#/d'                        "${File_Path}/Proxy-domain-OPNsense.list"
sed -i '/#/d'                        "${File_Path}/Direct-domain-OPNsense.list"
sed -i 's/IP-CIDR,//g'               "${File_Path}/Proxy-domain-OPNsense.list"
sed -i 's/IP-CIDR,//g'               "${File_Path}/Direct-domain-OPNsense.list"
sed -i 's/,no-resolve//g'            "${File_Path}/Proxy-domain-OPNsense.list"
sed -i 's/,no-resolve//g'            "${File_Path}/Direct-domain-OPNsense.list"
sed -i 's/DOMAIN-KEYWORD,//g'        "${File_Path}/Proxy-domain-OPNsense.list"
sed -i 's/DOMAIN-KEYWORD,//g'        "${File_Path}/Direct-domain-OPNsense.list"
sed -i 's/DOMAIN,//g'                "${File_Path}/Proxy-domain-OPNsense.list"
sed -i 's/DOMAIN,//g'                "${File_Path}/Direct-domain-OPNsense.list"
sed -i 's/DOMAIN-SUFFIX,//g'         "${File_Path}/Proxy-domain-OPNsense.list"
sed -i 's/DOMAIN-SUFFIX,//g'         "${File_Path}/Direct-domain-OPNsense.list"
sed -i '/^\s*$/d'                    "${File_Path}/Proxy-domain-OPNsense.list"
sed -i '/^\s*$/d'                    "${File_Path}/Direct-domain-OPNsense.list"
sed -i '/\./!d'                      "${File_Path}/Proxy-domain-OPNsense.list"
sed -i '/\./!d'                      "${File_Path}/Direct-domain-OPNsense.list"
echo "完成"
echo "Mosdns修改"
sed -i '/IP-CIDR/d'                          "${File_Path}/Proxy-domain-Mosdns.list"
sed -i '/IP-CIDR/d'                          "${File_Path}/Direct-domain-Mosdns.list"
sed -i 's/DOMAIN-KEYWORD,/keyword:/g'        "${File_Path}/Proxy-domain-Mosdns.list"
sed -i 's/DOMAIN-KEYWORD,/keyword:/g'        "${File_Path}/Direct-domain-Mosdns.list"
sed -i 's/DOMAIN,/domain:/g'                 "${File_Path}/Proxy-domain-Mosdns.list"
sed -i 's/DOMAIN,/domain:/g'                 "${File_Path}/Direct-domain-Mosdns.list"
sed -i 's/DOMAIN-SUFFIX,/keyword:/g'         "${File_Path}/Proxy-domain-Mosdns.list"
sed -i 's/DOMAIN-SUFFIX,/keyword:/g'         "${File_Path}/Direct-domain-Mosdns.list"
echo "完成"
echo "——————————————————————————————————文件内容修改结束——————————————————————————————————"

echo -e "\n"

echo "——————————————————————————————————文件权限修改开始——————————————————————————————————"
echo "修改文件所有人"
chown ${PUID}:${PGID} "${File_Path}/Proxy-domain".list*
chown ${PUID}:${PGID} "${File_Path}/Direct-domain".list*
chown ${PUID}:${PGID} "${File_Path}/Proxy-domain-OPNsense".list*
chown ${PUID}:${PGID} "${File_Path}/Direct-domain-OPNsense".list*
chown ${PUID}:${PGID} "${File_Path}/Proxy-domain-Mosdns".list*
chown ${PUID}:${PGID} "${File_Path}/Direct-domain-Mosdns".list*
echo "完成"
echo "修改文件权限"
chmod 644 "${File_Path}/Proxy-domain".list*
chmod 644 "${File_Path}/Direct-domain".list*
chmod 644 "${File_Path}/Proxy-domain-OPNsense".list*
chmod 644 "${File_Path}/Direct-domain-OPNsense".list*
chmod 644 "${File_Path}/Proxy-domain-Mosdns".list*
chmod 644 "${File_Path}/Direct-domain-Mosdns".list*
echo "完成"
echo "——————————————————————————————————文件权限修改结束——————————————————————————————————"

echo "脚本执行完成"
echo -e "\n\n"