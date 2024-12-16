package sample;

public class FileInfo {
	
	    private String fileName;
	    private String description;
	    private int vendorId;
	    public int getVendorId() {
			return vendorId;
		}

		public void setVendorId(int vendorId) {
			this.vendorId = vendorId;
		}

		public String getVendorName() {
			return vendorName;
		}

		public void setVendorName(String vendorName) {
			this.vendorName = vendorName;
		}

		private String vendorName;

	   

	    public FileInfo(String fileName, String description, int vendorId, String vendorName) {
			super();
			this.fileName = fileName;
			this.description = description;
			this.vendorId = vendorId;
			this.vendorName = vendorName;
		}

		public String getFileName() {
	        return fileName;
	    }

	    public void setFileName(String fileName) {
	        this.fileName = fileName;
	    }

	    public String getDescription() {
	        return description;
	    }

	    public void setDescription(String description) {
	        this.description = description;
	    }
	}



