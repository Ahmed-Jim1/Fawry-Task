
# 🛠️ Troubleshooting `internal.example.com` Unreachable Issue

Your mission:  
- Verify DNS  
- Check service reachability  
- Identify all possible causes  
- Propose and apply fixes  
- (Bonus) Test by editing `/etc/hosts` and make DNS settings persistent.

---

# 🔥 Step-by-Step Solution 

---

## 1. Check Current DNS Settings

```bash
cat /etc/resolv.conf
```

**Example Output:**

![image](https://github.com/user-attachments/assets/2870d104-9a80-4aac-9af2-5f63082e078a)


---

## 2. Check if Domain Resolves Using Default DNS

```bash
nslookup internal.example.com
```

**Example Output:**

![image](https://github.com/user-attachments/assets/1b445659-ce21-44e5-a5bd-a3543012f1a6)


---

## 3. Try Resolving Using Google DNS (8.8.8.8)

```bash
nslookup internal.example.com 8.8.8.8
```

**Example Output:**

![image](https://github.com/user-attachments/assets/44466281-de79-43cf-a0b2-3b0005f4d368)


---

## 4. Test Service Access with `curl`

```bash
curl -I http://internal.example.com
```

**Example Output:**

![image](https://github.com/user-attachments/assets/1f959a7c-4df9-40ed-9c2e-1d9b5c2de6cd)

---

## 5. Try Accessing the Service by Direct IP

```bash
curl -I <Server IP>
```

**Example Output:**
expected output
```
HTTP/1.1 200 OK
Server: nginx/1.18.0
Date: Mon, 28 Apr 2025 10:00:00 GMT
Content-Type: text/html
Content-Length: 612
Connection: keep-alive
```

---

## 6. Check if the Server is Listening on Port 80

```bash
sudo netstat -tulnp | grep :80
```

**Example Output:**
expected output
```
tcp6       0      0 :::80                   :::*                    LISTEN      1234/nginx: master
```

---

# 🧪 List of All Possible Causes

| Possible Issue | Description |
|:---|:---|
| DNS misconfiguration | No record for `internal.example.com` on your DNS server |
| Wrong `/etc/resolv.conf` settings | Pointing to wrong or offline DNS server |
| DNS server down or service stopped | The DNS server process might be dead |
| Firewall blocking DNS queries | Network firewall blocks DNS |
| Service listening on wrong ports | HTTP/HTTPS ports closed |
| Network routing issues | Cannot reach internal IP |
| SSL/TLS errors (if HTTPS) | Certificate issues |

---

# ✅ How to Confirm and Fix Each Issue

---

## 🔵 DNS Record Missing

- **Confirm:**  
```bash
nslookup internal.example.com
```

- **Fix:**  
Contact DNS admin to add a proper A record on internal DNS server.

---

## 🔵 Wrong /etc/resolv.conf Configuration

- **Confirm:**  
```bash
cat /etc/resolv.conf
```

- **Fix:**  
```bash
sudo nano /etc/resolv.conf
# Add correct DNS
nameserver <DNS IP>
```

---

## 🔵 DNS Service Down

- **Confirm:**  
```bash
systemctl status named
```

- **Fix:**  
```bash
sudo systemctl restart named
```

---

## 🔵 Service Port Not Listening

- **Confirm:**  
```bash
sudo netstat -tulnp | grep :80
```

- **Fix:**  
```bash
sudo systemctl restart nginx
```

---

## 🔵 Firewall Blocking Traffic

- **Confirm:**  
```bash
sudo iptables -L
sudo ufw status
```

- **Fix:**  
```bash
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
```

---

# 🏆 Bonus: Test with `/etc/hosts` Entry

To bypass DNS temporarily:

```bash
sudo nano /etc/hosts
```

Add entry:

```
<Server IP> internal.example.com
```

Then test:

```bash
ping internal.example.com
```

**Example Output:**
expected output
```
PING internal.example.com (192.168.1.50) 56(84) bytes of data.
64 bytes from 192.168.1.50: icmp_seq=1 ttl=64 time=0.556 ms
```

---

# 🏆 Bonus 2: Make DNS Settings Persistent

If your system uses `systemd-resolved`:

- Edit `/etc/systemd/resolved.conf`:

```bash
sudo nano /etc/systemd/resolved.conf
```

Add or modify:

```
[Resolve]
DNS=192.168.1.1
FallbackDNS=8.8.8.8
```

Then restart the service:

```bash
sudo systemctl restart systemd-resolved
```
