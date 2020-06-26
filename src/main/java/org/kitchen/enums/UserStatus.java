package org.kitchen.enums;

import org.apache.ibatis.type.MappedTypes;
import org.kitchen.handlers.CodeEnumTypeHandler;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
public enum UserStatus implements CodeEnum {
	ACTIVE("1"),
	PENDING("2"),
	SUSPENDED("3");
	
	@Getter
	public final String status;
	
	private UserStatus(String status) {
		this.status = status;
	}
	
	public String getCode() {
		return this.status;
	}
	
	@MappedTypes(UserStatus.class)
    public static class TypeHandler extends CodeEnumTypeHandler<UserStatus> {
        public TypeHandler() {
            super(UserStatus.class);
        }
    }

}
