/**
 * Autogenerated by Thrift Compiler (0.7.0)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 */
package org.apache.hadoop.thriftfs.api;

import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.EnumMap;
import java.util.Set;
import java.util.HashSet;
import java.util.EnumSet;
import java.util.Collections;
import java.util.BitSet;
import java.nio.ByteBuffer;
import java.util.Arrays;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UpgradeStatusReport implements org.apache.thrift.TBase<UpgradeStatusReport, UpgradeStatusReport._Fields>, java.io.Serializable, Cloneable {
  private static final org.apache.thrift.protocol.TStruct STRUCT_DESC = new org.apache.thrift.protocol.TStruct("UpgradeStatusReport");

  private static final org.apache.thrift.protocol.TField VERSION_FIELD_DESC = new org.apache.thrift.protocol.TField("version", org.apache.thrift.protocol.TType.I32, (short)1);
  private static final org.apache.thrift.protocol.TField PERCENT_COMPLETE_FIELD_DESC = new org.apache.thrift.protocol.TField("percentComplete", org.apache.thrift.protocol.TType.I16, (short)2);
  private static final org.apache.thrift.protocol.TField FINALIZED_FIELD_DESC = new org.apache.thrift.protocol.TField("finalized", org.apache.thrift.protocol.TType.BOOL, (short)3);
  private static final org.apache.thrift.protocol.TField STATUS_TEXT_FIELD_DESC = new org.apache.thrift.protocol.TField("statusText", org.apache.thrift.protocol.TType.STRING, (short)4);

  public int version; // required
  public short percentComplete; // required
  public boolean finalized; // required
  /**
   * The informative text that is the same as is shown on the NN web UI
   */
  public String statusText; // required

  /** The set of fields this struct contains, along with convenience methods for finding and manipulating them. */
  public enum _Fields implements org.apache.thrift.TFieldIdEnum {
    VERSION((short)1, "version"),
    PERCENT_COMPLETE((short)2, "percentComplete"),
    FINALIZED((short)3, "finalized"),
    /**
     * The informative text that is the same as is shown on the NN web UI
     */
    STATUS_TEXT((short)4, "statusText");

    private static final Map<String, _Fields> byName = new HashMap<String, _Fields>();

    static {
      for (_Fields field : EnumSet.allOf(_Fields.class)) {
        byName.put(field.getFieldName(), field);
      }
    }

    /**
     * Find the _Fields constant that matches fieldId, or null if its not found.
     */
    public static _Fields findByThriftId(int fieldId) {
      switch(fieldId) {
        case 1: // VERSION
          return VERSION;
        case 2: // PERCENT_COMPLETE
          return PERCENT_COMPLETE;
        case 3: // FINALIZED
          return FINALIZED;
        case 4: // STATUS_TEXT
          return STATUS_TEXT;
        default:
          return null;
      }
    }

    /**
     * Find the _Fields constant that matches fieldId, throwing an exception
     * if it is not found.
     */
    public static _Fields findByThriftIdOrThrow(int fieldId) {
      _Fields fields = findByThriftId(fieldId);
      if (fields == null) throw new IllegalArgumentException("Field " + fieldId + " doesn't exist!");
      return fields;
    }

    /**
     * Find the _Fields constant that matches name, or null if its not found.
     */
    public static _Fields findByName(String name) {
      return byName.get(name);
    }

    private final short _thriftId;
    private final String _fieldName;

    _Fields(short thriftId, String fieldName) {
      _thriftId = thriftId;
      _fieldName = fieldName;
    }

    public short getThriftFieldId() {
      return _thriftId;
    }

    public String getFieldName() {
      return _fieldName;
    }
  }

  // isset id assignments
  private static final int __VERSION_ISSET_ID = 0;
  private static final int __PERCENTCOMPLETE_ISSET_ID = 1;
  private static final int __FINALIZED_ISSET_ID = 2;
  private BitSet __isset_bit_vector = new BitSet(3);

  public static final Map<_Fields, org.apache.thrift.meta_data.FieldMetaData> metaDataMap;
  static {
    Map<_Fields, org.apache.thrift.meta_data.FieldMetaData> tmpMap = new EnumMap<_Fields, org.apache.thrift.meta_data.FieldMetaData>(_Fields.class);
    tmpMap.put(_Fields.VERSION, new org.apache.thrift.meta_data.FieldMetaData("version", org.apache.thrift.TFieldRequirementType.DEFAULT, 
        new org.apache.thrift.meta_data.FieldValueMetaData(org.apache.thrift.protocol.TType.I32)));
    tmpMap.put(_Fields.PERCENT_COMPLETE, new org.apache.thrift.meta_data.FieldMetaData("percentComplete", org.apache.thrift.TFieldRequirementType.DEFAULT, 
        new org.apache.thrift.meta_data.FieldValueMetaData(org.apache.thrift.protocol.TType.I16)));
    tmpMap.put(_Fields.FINALIZED, new org.apache.thrift.meta_data.FieldMetaData("finalized", org.apache.thrift.TFieldRequirementType.DEFAULT, 
        new org.apache.thrift.meta_data.FieldValueMetaData(org.apache.thrift.protocol.TType.BOOL)));
    tmpMap.put(_Fields.STATUS_TEXT, new org.apache.thrift.meta_data.FieldMetaData("statusText", org.apache.thrift.TFieldRequirementType.DEFAULT, 
        new org.apache.thrift.meta_data.FieldValueMetaData(org.apache.thrift.protocol.TType.STRING)));
    metaDataMap = Collections.unmodifiableMap(tmpMap);
    org.apache.thrift.meta_data.FieldMetaData.addStructMetaDataMap(UpgradeStatusReport.class, metaDataMap);
  }

  public UpgradeStatusReport() {
  }

  public UpgradeStatusReport(
    int version,
    short percentComplete,
    boolean finalized,
    String statusText)
  {
    this();
    this.version = version;
    setVersionIsSet(true);
    this.percentComplete = percentComplete;
    setPercentCompleteIsSet(true);
    this.finalized = finalized;
    setFinalizedIsSet(true);
    this.statusText = statusText;
  }

  /**
   * Performs a deep copy on <i>other</i>.
   */
  public UpgradeStatusReport(UpgradeStatusReport other) {
    __isset_bit_vector.clear();
    __isset_bit_vector.or(other.__isset_bit_vector);
    this.version = other.version;
    this.percentComplete = other.percentComplete;
    this.finalized = other.finalized;
    if (other.isSetStatusText()) {
      this.statusText = other.statusText;
    }
  }

  public UpgradeStatusReport deepCopy() {
    return new UpgradeStatusReport(this);
  }

  @Override
  public void clear() {
    setVersionIsSet(false);
    this.version = 0;
    setPercentCompleteIsSet(false);
    this.percentComplete = 0;
    setFinalizedIsSet(false);
    this.finalized = false;
    this.statusText = null;
  }

  public int getVersion() {
    return this.version;
  }

  public UpgradeStatusReport setVersion(int version) {
    this.version = version;
    setVersionIsSet(true);
    return this;
  }

  public void unsetVersion() {
    __isset_bit_vector.clear(__VERSION_ISSET_ID);
  }

  /** Returns true if field version is set (has been assigned a value) and false otherwise */
  public boolean isSetVersion() {
    return __isset_bit_vector.get(__VERSION_ISSET_ID);
  }

  public void setVersionIsSet(boolean value) {
    __isset_bit_vector.set(__VERSION_ISSET_ID, value);
  }

  public short getPercentComplete() {
    return this.percentComplete;
  }

  public UpgradeStatusReport setPercentComplete(short percentComplete) {
    this.percentComplete = percentComplete;
    setPercentCompleteIsSet(true);
    return this;
  }

  public void unsetPercentComplete() {
    __isset_bit_vector.clear(__PERCENTCOMPLETE_ISSET_ID);
  }

  /** Returns true if field percentComplete is set (has been assigned a value) and false otherwise */
  public boolean isSetPercentComplete() {
    return __isset_bit_vector.get(__PERCENTCOMPLETE_ISSET_ID);
  }

  public void setPercentCompleteIsSet(boolean value) {
    __isset_bit_vector.set(__PERCENTCOMPLETE_ISSET_ID, value);
  }

  public boolean isFinalized() {
    return this.finalized;
  }

  public UpgradeStatusReport setFinalized(boolean finalized) {
    this.finalized = finalized;
    setFinalizedIsSet(true);
    return this;
  }

  public void unsetFinalized() {
    __isset_bit_vector.clear(__FINALIZED_ISSET_ID);
  }

  /** Returns true if field finalized is set (has been assigned a value) and false otherwise */
  public boolean isSetFinalized() {
    return __isset_bit_vector.get(__FINALIZED_ISSET_ID);
  }

  public void setFinalizedIsSet(boolean value) {
    __isset_bit_vector.set(__FINALIZED_ISSET_ID, value);
  }

  /**
   * The informative text that is the same as is shown on the NN web UI
   */
  public String getStatusText() {
    return this.statusText;
  }

  /**
   * The informative text that is the same as is shown on the NN web UI
   */
  public UpgradeStatusReport setStatusText(String statusText) {
    this.statusText = statusText;
    return this;
  }

  public void unsetStatusText() {
    this.statusText = null;
  }

  /** Returns true if field statusText is set (has been assigned a value) and false otherwise */
  public boolean isSetStatusText() {
    return this.statusText != null;
  }

  public void setStatusTextIsSet(boolean value) {
    if (!value) {
      this.statusText = null;
    }
  }

  public void setFieldValue(_Fields field, Object value) {
    switch (field) {
    case VERSION:
      if (value == null) {
        unsetVersion();
      } else {
        setVersion((Integer)value);
      }
      break;

    case PERCENT_COMPLETE:
      if (value == null) {
        unsetPercentComplete();
      } else {
        setPercentComplete((Short)value);
      }
      break;

    case FINALIZED:
      if (value == null) {
        unsetFinalized();
      } else {
        setFinalized((Boolean)value);
      }
      break;

    case STATUS_TEXT:
      if (value == null) {
        unsetStatusText();
      } else {
        setStatusText((String)value);
      }
      break;

    }
  }

  public Object getFieldValue(_Fields field) {
    switch (field) {
    case VERSION:
      return Integer.valueOf(getVersion());

    case PERCENT_COMPLETE:
      return Short.valueOf(getPercentComplete());

    case FINALIZED:
      return Boolean.valueOf(isFinalized());

    case STATUS_TEXT:
      return getStatusText();

    }
    throw new IllegalStateException();
  }

  /** Returns true if field corresponding to fieldID is set (has been assigned a value) and false otherwise */
  public boolean isSet(_Fields field) {
    if (field == null) {
      throw new IllegalArgumentException();
    }

    switch (field) {
    case VERSION:
      return isSetVersion();
    case PERCENT_COMPLETE:
      return isSetPercentComplete();
    case FINALIZED:
      return isSetFinalized();
    case STATUS_TEXT:
      return isSetStatusText();
    }
    throw new IllegalStateException();
  }

  @Override
  public boolean equals(Object that) {
    if (that == null)
      return false;
    if (that instanceof UpgradeStatusReport)
      return this.equals((UpgradeStatusReport)that);
    return false;
  }

  public boolean equals(UpgradeStatusReport that) {
    if (that == null)
      return false;

    boolean this_present_version = true;
    boolean that_present_version = true;
    if (this_present_version || that_present_version) {
      if (!(this_present_version && that_present_version))
        return false;
      if (this.version != that.version)
        return false;
    }

    boolean this_present_percentComplete = true;
    boolean that_present_percentComplete = true;
    if (this_present_percentComplete || that_present_percentComplete) {
      if (!(this_present_percentComplete && that_present_percentComplete))
        return false;
      if (this.percentComplete != that.percentComplete)
        return false;
    }

    boolean this_present_finalized = true;
    boolean that_present_finalized = true;
    if (this_present_finalized || that_present_finalized) {
      if (!(this_present_finalized && that_present_finalized))
        return false;
      if (this.finalized != that.finalized)
        return false;
    }

    boolean this_present_statusText = true && this.isSetStatusText();
    boolean that_present_statusText = true && that.isSetStatusText();
    if (this_present_statusText || that_present_statusText) {
      if (!(this_present_statusText && that_present_statusText))
        return false;
      if (!this.statusText.equals(that.statusText))
        return false;
    }

    return true;
  }

  @Override
  public int hashCode() {
    return 0;
  }

  public int compareTo(UpgradeStatusReport other) {
    if (!getClass().equals(other.getClass())) {
      return getClass().getName().compareTo(other.getClass().getName());
    }

    int lastComparison = 0;
    UpgradeStatusReport typedOther = (UpgradeStatusReport)other;

    lastComparison = Boolean.valueOf(isSetVersion()).compareTo(typedOther.isSetVersion());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetVersion()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.version, typedOther.version);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    lastComparison = Boolean.valueOf(isSetPercentComplete()).compareTo(typedOther.isSetPercentComplete());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetPercentComplete()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.percentComplete, typedOther.percentComplete);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    lastComparison = Boolean.valueOf(isSetFinalized()).compareTo(typedOther.isSetFinalized());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetFinalized()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.finalized, typedOther.finalized);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    lastComparison = Boolean.valueOf(isSetStatusText()).compareTo(typedOther.isSetStatusText());
    if (lastComparison != 0) {
      return lastComparison;
    }
    if (isSetStatusText()) {
      lastComparison = org.apache.thrift.TBaseHelper.compareTo(this.statusText, typedOther.statusText);
      if (lastComparison != 0) {
        return lastComparison;
      }
    }
    return 0;
  }

  public _Fields fieldForId(int fieldId) {
    return _Fields.findByThriftId(fieldId);
  }

  public void read(org.apache.thrift.protocol.TProtocol iprot) throws org.apache.thrift.TException {
    org.apache.thrift.protocol.TField field;
    iprot.readStructBegin();
    while (true)
    {
      field = iprot.readFieldBegin();
      if (field.type == org.apache.thrift.protocol.TType.STOP) { 
        break;
      }
      switch (field.id) {
        case 1: // VERSION
          if (field.type == org.apache.thrift.protocol.TType.I32) {
            this.version = iprot.readI32();
            setVersionIsSet(true);
          } else { 
            org.apache.thrift.protocol.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case 2: // PERCENT_COMPLETE
          if (field.type == org.apache.thrift.protocol.TType.I16) {
            this.percentComplete = iprot.readI16();
            setPercentCompleteIsSet(true);
          } else { 
            org.apache.thrift.protocol.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case 3: // FINALIZED
          if (field.type == org.apache.thrift.protocol.TType.BOOL) {
            this.finalized = iprot.readBool();
            setFinalizedIsSet(true);
          } else { 
            org.apache.thrift.protocol.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        case 4: // STATUS_TEXT
          if (field.type == org.apache.thrift.protocol.TType.STRING) {
            this.statusText = iprot.readString();
          } else { 
            org.apache.thrift.protocol.TProtocolUtil.skip(iprot, field.type);
          }
          break;
        default:
          org.apache.thrift.protocol.TProtocolUtil.skip(iprot, field.type);
      }
      iprot.readFieldEnd();
    }
    iprot.readStructEnd();

    // check for required fields of primitive type, which can't be checked in the validate method
    validate();
  }

  public void write(org.apache.thrift.protocol.TProtocol oprot) throws org.apache.thrift.TException {
    validate();

    oprot.writeStructBegin(STRUCT_DESC);
    oprot.writeFieldBegin(VERSION_FIELD_DESC);
    oprot.writeI32(this.version);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(PERCENT_COMPLETE_FIELD_DESC);
    oprot.writeI16(this.percentComplete);
    oprot.writeFieldEnd();
    oprot.writeFieldBegin(FINALIZED_FIELD_DESC);
    oprot.writeBool(this.finalized);
    oprot.writeFieldEnd();
    if (this.statusText != null) {
      oprot.writeFieldBegin(STATUS_TEXT_FIELD_DESC);
      oprot.writeString(this.statusText);
      oprot.writeFieldEnd();
    }
    oprot.writeFieldStop();
    oprot.writeStructEnd();
  }

  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder("UpgradeStatusReport(");
    boolean first = true;

    sb.append("version:");
    sb.append(this.version);
    first = false;
    if (!first) sb.append(", ");
    sb.append("percentComplete:");
    sb.append(this.percentComplete);
    first = false;
    if (!first) sb.append(", ");
    sb.append("finalized:");
    sb.append(this.finalized);
    first = false;
    if (!first) sb.append(", ");
    sb.append("statusText:");
    if (this.statusText == null) {
      sb.append("null");
    } else {
      sb.append(this.statusText);
    }
    first = false;
    sb.append(")");
    return sb.toString();
  }

  public void validate() throws org.apache.thrift.TException {
    // check for required fields
  }

  private void writeObject(java.io.ObjectOutputStream out) throws java.io.IOException {
    try {
      write(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(out)));
    } catch (org.apache.thrift.TException te) {
      throw new java.io.IOException(te);
    }
  }

  private void readObject(java.io.ObjectInputStream in) throws java.io.IOException, ClassNotFoundException {
    try {
      // it doesn't seem like you should have to do this, but java serialization is wacky, and doesn't call the default constructor.
      __isset_bit_vector = new BitSet(1);
      read(new org.apache.thrift.protocol.TCompactProtocol(new org.apache.thrift.transport.TIOStreamTransport(in)));
    } catch (org.apache.thrift.TException te) {
      throw new java.io.IOException(te);
    }
  }

}

