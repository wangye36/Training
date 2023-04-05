for i in {001..100}
do
	name="user$i"
	useradd -m $name 
	echo "$name:123456" | chpasswd
done
