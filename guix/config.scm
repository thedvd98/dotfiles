;; 'guix system reconfigure' command to effect your changes.


;; Indicate which modules to import to access the variables
;; used in this configuration.
(use-modules (gnu)
             (nongnu packages linux)
             (nongnu system linux-initrd))
(use-service-modules cups desktop networking ssh xorg)

(operating-system
  (kernel linux)
  (initrd microcode-initrd)
  (firmware (list
	      iwlwifi-firmware
	      sof-firmware
	      linux-firmware))
  (locale "en_US.utf8")
  (timezone "Europe/Rome")
  (keyboard-layout (keyboard-layout "us" "euro" #:options '("ctrl:nocaps" "compose:ralt")))
  (host-name "thinkops")

  ;; The list of user accounts ('root' is implicit).
  (users (cons* (user-account
                  (name "anon")
                  (comment "Anon")
                  (group "users")
                  (home-directory "/home/anon")
                  (supplementary-groups '("wheel" "netdev" "audio" "video")))
                %base-user-accounts))

  ;; Packages installed system-wide.  Users can also install packages
  ;; under their own account: use 'guix search KEYWORD' to search
  ;; for packages and 'guix install PACKAGE' to install a package.
  (packages (append (list (specification->package "vim"))
                    %base-packages))

  ;; Below is the list of system services.  To search for available
  ;; services, run 'guix system search KEYWORD' in a terminal.
  (services
    ;; This is the default list of services we
    ;; are appending to.
    (cons* (service bluetooth-service-type)
           (service gnome-desktop-service-type)
           (set-xorg-configuration
             (xorg-configuration
               (keyboard-layout keyboard-layout)))
           (modify-services 
             %desktop-services
             (guix-service-type config =>
                                (guix-configuration
                                  (inherit config)
                                  (substitute-urls
                                    (append (list "https://substitutes.nonguix.org")
                                            %default-substitute-urls))
                                  (authorized-keys
                                    (append (list (local-file "./nonguix-signing-key.pub"))
                                            %default-authorized-guix-keys)))))))

  (bootloader (bootloader-configuration
                (bootloader grub-efi-bootloader)
                (targets (list "/boot/efi"))
                (keyboard-layout keyboard-layout)))
  (mapped-devices (list (mapped-device
                          (source (uuid
                                   "8725d02b-9983-4760-bced-8b1f6521f8f4"))
                          (target "cryptroot")
                          (type luks-device-mapping))))

  ;; The list of file systems that get "mounted".  The unique
  ;; file system identifiers there ("UUIDs") can be obtained
  ;; by running 'blkid' in a terminal.
  (file-systems (cons* (file-system
                         (mount-point "/boot/efi")
                         (device (uuid "7023-180E"
                                       'fat32))
                         (type "vfat"))
                       (file-system
                         (mount-point "/")
                         (device "/dev/mapper/cryptroot")
                         (type "ext4")
                         (dependencies mapped-devices)) %base-file-systems)))
