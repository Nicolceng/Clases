#!/bin/sh


echo "##################################################################"
echo "                          ESTATUS APACHE"
echo "##################################################################"
SERVICEweb='apache2'
if ps ax | grep -v grep | grep $SERVICEweb > /dev/null
then
echo "$SERVICEweb ----OK----"
else
echo "$SERVICEweb ////DETENIDO\\\\"
fi


echo "##################################################################"
echo "                          ESTATUS MYSQL"
echo "##################################################################"
SERVICEbd='mysqld'
if ps ax | grep -v grep | grep $SERVICEbd > /dev/null
then
echo "$SERVICEbd ----OK----"
else
echo "$SERVICEbd ////DETENIDO\\\\"
fi

echo "########################### THE END ##############################"

