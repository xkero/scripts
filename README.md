Some shell scripts I've written, all licensed GPLv3 unless otherwise stated.

What each script does:

<table>
	<tr>
		<th><a href="fans">fans</a></th>
		<td><code>fans &lt;rpm of first fan&gt; [rpm of second fan, if omitted first arg is applied to both fans]</code></td>
		<td>E.g. <code>fans 2000</code>, <code>fans 1000 1500</code></td>
	</tr>
	<tr>
		<td colspan=3>Changes the speed of the fans on my Corsair H110i GT via <code>printf</code>'ing directly into its <code>/dev/hidraw</code> device. I believe with some adjustments it should work on other Corsair Hydro series liquid cooling systems, but no guarantees.</td>
	</tr>
	<tr>
		<th><a href="img">img</a></th>
		<td><code>img &lt;image files...&gt;</code></td>
		<td>E.g. <code>img photo001.jpg photo002.jpg</code></td>
	</tr>
	<tr>
		<td colspan=3>Displays images in the terminal in 24bit colour and using half-height block characters <code>▄</code>. Uses imagemagick so <a href="https://www.imagemagick.org/script/formats.php#supported">supports anything that does</a>.</td>
	</tr>
	<tr>
		<th><a href="s">s</a></th>
		<td>
      Host status: <code>s</code><br>
			Service status: <code>s &lt;service name&gt;</code><br>
			Log: <code>log [journalctl args]</code><br>
      Trailing service log: <code>log [service name]</code><br>
			Start service: <code>start &lt;service name&gt;</code><br>
			Stop service: <code>stop &lt;service name&gt;</code><br>
			Restart service: <code>restart &lt;service name&gt;</code><br>
			Start inactive or stop active service: <code>toggle &lt;service name&gt;</code><br>
			Enable starting service at boot: <code>stay &lt;service name&gt;</code><br>
			Disable starting service at boot: <code>leave &lt;service name&gt;</code><br>
			Reload systemd unit files: <code>reload</code><br>
			Reload service's config: <code>reload &lt;service name&gt;</code>
		</td>
		<td>E.g. <code>s</code>, <code>restart sshd</code>, <code>toggle transmission</code></td>
	</tr>
	<tr>
		<td colspan=3>The <b>S</b>imple <b>S</b>hort <b>S</b>ervice <b>S</b>cript is an easier to type alternative to systemd's verbose <code>systemctl</code> for controlling services. Create these symbolic links to it <code>sudo for i in log start stop restart toggle stay leave reload; do ln -s /usr/local/bin/{s,$i}; end</code>.</td>
	</tr>
	<!-- Template to copy'n'paste
	<tr>
		<th></th>
		<td><code></code></td>
		<td>E.g. <code></code></td>
	</tr>
	<tr>
		<td colspan=3></td>
	</tr>
	-->
</table>
