version 1.0

task direct_modification {
	input {
		File textfile

		# runtime attributes
		Int cpu = 2
		Int memory = 4
		Int preempt = 3
	}
	
	command {
		set -eux -o pipefail

		ls -lha .
		ls -lha ~{textfile}

		python << CODE
		import os
		f = open("~{textfile}", "a")
		f.write("\n\n\n")
		f.write("This text file has been modified directly, in flagrant disregard of what the lines above say to do!")
		f.close()
		exit()
		CODE
	}
	
	runtime {
		cpu: cpu
		docker: "uwgac/topmed-master@sha256:0bb7f98d6b9182d4e4a6b82c98c04a244d766707875ddfd8a48005a9f5c5481e"
		disks: "local-disk 1 HDD"
		memory: "${memory} GB"
		preemptibles: "${preempt}"
	}
}

workflow directly_modify_inputs {
	input {
		File textfile
	}

	call direct_modification {
		input:
			textfile = textfile
	}
}
