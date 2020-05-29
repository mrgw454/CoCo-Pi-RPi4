xmlstarlet ed --inplace -s "/mameconfig/system[@name='coco3']" -t elem -n input cfg/coco3.cfg
xmlstarlet ed --inplace -s "/mameconfig/system[@name='coco3']/input" -t elem -n port cfg/coco3.cfg
xmlstarlet ed --inplace -s "/mameconfig/system[@name='coco3']/input/port" -t attr -n tag -v ':beckerport' cfg/coco3.cfg
xmlstarlet ed --inplace -s "/mameconfig/system[@name='coco3']/input/port" -t attr -n type -v 'CONFIG' cfg/coco3.cfg
xmlstarlet ed --inplace -s "/mameconfig/system[@name='coco3']/input/port" -t attr -n mask -v 1 cfg/coco3.cfg
xmlstarlet ed --inplace -s "/mameconfig/system[@name='coco3']/input/port" -t attr -n defvalue -v 1 cfg/coco3.cfg
xmlstarlet ed --inplace -s "/mameconfig/system[@name='coco3']/input/port" -t attr -n value -v 0 cfg/coco3.cfg

xmlstarlet ed --inplace -u "/mameconfig/system[@name='coco3']/input/port[@tag=':beckerport']/@value" --value "0" cfg/coco3.cfg
