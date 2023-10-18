package testWeb.vo;

public class RobotInfo {

	private  int ID;
	private String NAME;
	private String weight;
    private String size;
	private String image;

	public int getID() {
		return ID;
	}

	public void setID(int ID) {
		this.ID = ID;
	}

	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNAME() {
		return NAME;
	}
	public void setNAME(String NAME) {
		this.NAME = NAME;
	}
	public String getweight() {
		return weight;
	}
	public void setweight(String weight) {
		this.weight = weight;
	}
	public String getiamge() {
		return image;
	}
	public void setimage(String image) {
		this.image = image;
	}
	public String getsize() {
		return size;
	}

	@Override
	public String toString() {
		return "RobotInfo{" +
				"ID=" + ID +
				", NAME='" + NAME + '\'' +
				", weight='" + weight + '\'' +
				", size='" + size + '\'' +
				", image='" + image + '\'' +
				'}';
	}

	public void setsize(String size) {
		this.size = size;
	}
}
